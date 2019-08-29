import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:epos_source_flutter/src/app/core/app_setting.dart';

enum GrandType { password, client_credentials }

enum StatusCodeGetToken {
  invalid_client,
  timeout,
  invalid_domain,
  TRUE,
  FALSE,
}

class ApiMaster {
  String aliasName = "ApiMaster";
  String api = "$domainApi/api";
  String clientId = "OXBNFh9a2yj4YBRgSXjI1W4OTO8mrN";
  String clienSecret = "smM4lVzzsnnvHrobQnr1oRUTDl02Ka";
  String username;
  String password;
  GrandType grandType = GrandType.client_credentials;
  GrandType grandTypeTemp = GrandType.client_credentials;
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
  };
  Map<String, dynamic> body;
  String _accessToken = "";
  get accessToken => _accessToken;
  DateTime _expiresIn;
  get expiresIn => _expiresIn;
  ApiMaster();

  ApiMaster.fromJson(Map<String, dynamic> json) {
    api = json['api'];
    clientId = json['clientId'];
    clienSecret = json['clienSecret'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api'] = this.api;
    data['clientId'] = this.clientId;
    data['clienSecret'] = this.clienSecret;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }

  String convertSerialize(Map<String, dynamic> obj) {
    var str = "";
    obj.forEach((key, value) {
      if (str != "") {
        str += "&";
      }
      if (value is List) {
        value.asMap().forEach((index, element) {
          if (element is String)
            element = "'$element'";
          else if (element is List) {
            element.asMap().forEach((indexChild, elementChild) {
              if (elementChild is String) elementChild = "'$elementChild'";
              element[indexChild] = elementChild;
            });
          }
          value[index] = element;
        });
      }
      str += key + "=" + Uri.encodeComponent(value.toString());
    });
    return str;
  }

  Future<StatusCodeGetToken> getToken() async {
    body = new Map();
    switch (grandType) {
      case GrandType.password:
        body["grant_type"] = "password";
        body["username"] = username;
        body["password"] = password;
        break;
      case GrandType.client_credentials:
        body["grant_type"] = "client_credentials";
        break;
      default:
    }
    body["scope"] = "all";
    body["client_id"] = clientId;
    body["client_secret"] = clienSecret;
    print('$api/authentication/oauth2/token');
    return http
        .post('$api/authentication/oauth2/token', body: body)
        .then((http.Response response) {
      switch (response.statusCode) {
        case 200:
          print(response.body);
          var result = jsonDecode(response.body);
          _accessToken = result["access_token"];
          _expiresIn =
              DateTime.now().add(Duration(seconds: result["expires_in"]));
          headers[HttpHeaders.authorizationHeader] = "Bearer $_accessToken";
          print(headers);
          return StatusCodeGetToken.TRUE;
          break;
        case 401:
          return StatusCodeGetToken.invalid_client;
          break;
        default:
          return StatusCodeGetToken.FALSE;
      }
    }).catchError((error) {
      print(error);
      return StatusCodeGetToken.invalid_domain;
    }).timeout(Duration(seconds: 10), onTimeout: () {
      return StatusCodeGetToken.invalid_domain;
    });
  }

  Future<StatusCodeGetToken> authorization({refresh: false}) async {
    StatusCodeGetToken result = StatusCodeGetToken.TRUE;
    if (refresh) {
      result = await getToken();
    } else {
      //kiểm tra nếu grandType thay đổi
      if (grandType == grandTypeTemp) {
        //kiểm tra nếu token tồn tại
        if (_expiresIn != null) {
          DateTime currentTime = DateTime.now();
          var diffTime = _expiresIn.difference(currentTime).inSeconds;
          print(diffTime);
          //lấy lại token.
          if (diffTime <= 0) result = await getToken();
        } else
          result = await getToken();
      } else {
        grandTypeTemp = grandType;
        result = await getToken();
      }
    }
    return result;
  }
}
