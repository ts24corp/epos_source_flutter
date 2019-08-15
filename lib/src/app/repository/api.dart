import 'dart:collection';
import 'dart:convert';
import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:http/http.dart' as http;

class Api {
  String api = "$domainApi/api/authentication/oauth2";
  String clientId = "OXBNFh9a2yj4YBRgSXjI1W4OTO8mrN";
  String clienSecret = "smM4lVzzsnnvHrobQnr1oRUTDl02Ka";
  Map<String, String> headers = new HashMap<String, String>();
  Map<String, String> body;
  Api();

  Future<void> getToken() async {
    body = new Map();
    body["grant_type"] = "client_credentials";
    body["scope"] = "all";
    body["client_id"] = clientId;
    body["client_secret"] = clienSecret;
    return http.post('$api/token', body: body).then((http.Response response) {
      print(response.body);
      var result = jsonDecode(response.body);
      print(result["expires_in"]);
    });
  }
}
