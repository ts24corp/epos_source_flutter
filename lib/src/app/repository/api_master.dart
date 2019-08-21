import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:epos_source_flutter/src/app/core/app_setting.dart';

enum GrandType { password, client_credentials }

class ApiMaster {
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

  Future<dynamic> getToken() async {
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
    return http
        .post('$api/authentication/oauth2/token', body: body)
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
        var result = jsonDecode(response.body);
        _accessToken = result["access_token"];
        _expiresIn =
            DateTime.now().add(Duration(seconds: result["expires_in"]));
        headers[HttpHeaders.authorizationHeader] = "Bearer $_accessToken";
        print(headers);
        return true;
      } else
        return false;
    });
  }

  Future<dynamic> authorization() async {
    bool result = true;
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
    return result;
  }
}
