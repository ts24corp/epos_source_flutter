import 'dart:convert';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:http/http.dart' as http;

import 'api_master.dart';

//document api https://www.odoo.com/apps/modules/12.0/muk_rest/
class Api1 extends ApiMaster {
  Api1();

//  /api/search_read/{model}
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
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/product.template?$params',
            headers: headers)
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
}
