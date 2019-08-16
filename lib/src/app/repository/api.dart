import 'dart:convert';
import 'dart:io';
import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:http/http.dart' as http;

class Api {
  String api = "$domainApi/api/authentication/oauth2";
  String clientId = "OXBNFh9a2yj4YBRgSXjI1W4OTO8mrN";
  String clienSecret = "smM4lVzzsnnvHrobQnr1oRUTDl02Ka";
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
  };
  Map<String, String> body;
  String _accessToken = "";
  get accessToken => _accessToken;
  int _expiresIn = 0;
  get expiresIn => _expiresIn;
  Api();

  Future<dynamic> getToken() async {
    body = new Map();
    body["grant_type"] = "client_credentials";
    body["scope"] = "all";
    body["client_id"] = clientId;
    body["client_secret"] = clienSecret;
    return http.post('$api/token', body: body).then((http.Response response) {
      print(response.body);
      var result = jsonDecode(response.body);
      _accessToken = result["access_token"];
      _expiresIn = result["expires_in"];
      headers[HttpHeaders.authorizationHeader] = "Bearer $_accessToken";
      print(headers);
    });
  }

  Future<dynamic> authorization() async {
    await getToken();
    body = new Map();
    var uri = Uri.http(domainApi, '/api/search', body);
    return http.get(uri, headers: headers).then((http.Response response) {
      print(response.body);
    });
  }
}
