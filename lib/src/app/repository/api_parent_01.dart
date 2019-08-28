import 'dart:convert';
import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:http/http.dart' as http;

import 'api_master.dart';

//document api https://www.odoo.com/apps/modules/12.0/muk_rest/
class Api1 extends ApiMaster {
  Api1();

  /// api/search_read/{model}
  Future<List<ProductTemplate>> getDataModelDemo() async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['name'];
    body["domain"] = [
      '|',
      [
        'name',
        'ilike',
        'apple',
      ],
      ['name', 'ilike', 'dưa hấu']
    ];
    body["limit"] = 10;
    body["order"] = "name desc";
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/product.template?$params',
            headers: this.headers)
        .then((http.Response response) {
      List<ProductTemplate> listResult = new List();
      if (response.statusCode == 200) {
        print(response.body);
        List list = json.decode(response.body);
        //list.map((item) => ProductTemplate.fromJsonMap(item)).toList();
        listResult =
            list.map((item) => ProductTemplate.fromJson(item)).toList();
        print(listResult);
      }
      return listResult;
    });
  }

  ///Kiểm tra thông tin đăng nhập.
  ///Trả về true or false.
  Future<bool> checkLogin({String username, String password}) async {
    var result = false;
    this.grandType = GrandType.password;
    this.username = username;
    this.password = password;
    result = await this.authorization(refresh: true);
    return result;
  }

  //Kiểm tra quyền truy cập POS
  Future<bool> checkAccessRightPOS() async {
    await this.authorization();
    return http
        .get('${this.api}/access/rights/pos.config', headers: this.headers)
        .then((http.Response response) {
      if (response.statusCode == 200) {
        bool result = response.body.toLowerCase() == 'true' ? true : false;
        return result;
      }
      return false;
    });
  }

  //Lấy thông tin user session
  Future<dynamic> getUserInfo() async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['name', 'id'];
    body["domain"] = [
      [
        'email',
        '=',
        this.username,
      ]
    ];
    body["limit"] = 1;
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/res.users?$params', headers: this.headers)
        .then((http.Response response) {
      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        return list;
      } else
        return null;
    }).catchError((error) {
      return null;
    });
  }

  ///Lưu thông tin cấu hình domain
  void saveConfigDomain({String domain, String clientID, String clientSecret}) {
    this.api = "$domain/api";
    domainApi = domain;
    this.clientId = clientId;
    this.clienSecret = clientSecret;
    localStorage.setItem(this.aliasName, json.encode(this.toJson()));
  }
}
