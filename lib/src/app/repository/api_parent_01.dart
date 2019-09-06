import 'dart:convert';
import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/model/config-domain.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:http/http.dart' as http;

import 'api_master.dart';

enum TypeImage {
  SMALL,
  MEDIUM,
  ORIGINAL,
}

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
  Future<StatusCodeGetToken> checkLogin(
      {ConfigDomain cfd, String username, String password}) async {
    StatusCodeGetToken result = StatusCodeGetToken.FALSE;
    this.grandType = GrandType.password;
    this.api = "${cfd.domain}/api";
    this.clientId = cfd.clientID;
    this.clienSecret = cfd.clientSecret;
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

  // ///Lưu thông tin cấu hình domain
  // void saveConfigDomain({String domain, String clientID, String clientSecret}) {
  //   this.api = "$domain/api";
  //   domainApi = domain;
  //   this.clientId = clientId;
  //   this.clienSecret = clientSecret;
  //   localStorage.setItem(this.aliasName, json.encode(this.toJson()));
  // }

  //Lấy danh sách POS
  Future<List<PosConfig>> getListPos() async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['name', 'pos_session_state'];
    body["domain"] = [
      ['active', '=', 'True']
    ];
    print('Body: $body');
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/pos.config?$params',
            headers: this.headers)
        .then((http.Response response) {
      List<PosConfig> listResult = new List();
      if (response.statusCode == 200) {
        print('RES.body: ${response.body}');
        List list = json.decode(response.body);
        listResult = list.map((item) => PosConfig.fromJson(item)).toList();
        print(listResult);
      }
      return listResult;
    });
  }

  //Lấy danh sách khách hàng
  Future<List<ResPartner>> getListCustomer() async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['name', 'contact_address', 'email', 'phone'];
    body["limit"] = 0;
    var params = convertSerialize(body);
    print('API full: ${this.api}/search_read/res.partner?$params');
    return http
        .get('${this.api}/search_read/res.partner?$params',
            headers: this.headers)
        .then((http.Response response) {
      List<ResPartner> listResult = new List();
      if (response.statusCode == 200) {
        print(response.body);
        List list = json.decode(response.body);
        listResult = list.map((item) => ResPartner.fromJson(item)).toList();
        //print(list);
      }
      return listResult;
    });
  }

  //Lấy tất cả id category cha 1-1
  Future<List<int>> getAllParentIDCategory() async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['id', 'name'];
    body["domain"] = [
      ['parent_id', '=', false]
    ];
    body["limit"] = 0;
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/pos.category?$params',
            headers: this.headers)
        .then((http.Response response) {
      List<int> listResult = new List();
      if (response.statusCode == 200) {
        print(response.body);
        List list = json.decode(response.body);
        if (list.length > 0) {
          var listPosCategory =
              list.map((item) => PosCategory.fromJson(item)).toList();
          listResult = listPosCategory.map((item) => item.id).toList();
        }
        //print(list);
      }
      return listResult;
    });
  }

  //Lấy danh sách category từ  list id 1-2
  Future<List<PosCategory>> getCategoryByID(List<int> id) async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['name', 'child_id', 'parent_id'];
    body["domain"] = [
      ['id', 'in', id]
    ];
    body["limit"] = 0;
    var params = convertSerialize(body);
    print('BODY: $body');
    return http
        .get('${this.api}/search_read/pos.category?$params',
            headers: this.headers)
        .then((http.Response response) {
      print('RES: ${response.body}');
      List<PosCategory> listResult = new List();
      if (response.statusCode == 200) {
        print(response.body);
        List list = json.decode(response.body);
        listResult = list.map((item) => PosCategory.fromJson(item)).toList();
        //print(list);
      }
      return listResult;
    });
  }

  //Lấy danh sách category từ parent id
  Future<List<PosCategory>> getCategoryByListParentID(int parentID) async {
    await this.authorization();
    body = new Map();
    body["fields"] = ['name', 'child_id', 'parent_id'];
    body["domain"] = [
      [
        'parent_id',
        'in',
        [parentID]
      ]
    ];
    body["limit"] = 0;
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/pos.category?$params',
            headers: this.headers)
        .then((http.Response response) {
      List<PosCategory> listResult = new List();
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        listResult = list.map((item) => PosCategory.fromJson(item)).toList();
        //print(list);
      }
      return listResult;
    });
  }

  //Tìm và lấy tất cả danh sách id category con từ danh sách parent id
  Future<List<int>> getAllCategoryIDByListParentID(
      List<int> listParentID) async {
    var listResult = listParentID;
    for (var i = 0; i < listParentID.length; i++) {
      var parentId = listParentID[i];
      var listChildCateg = await this.getCategoryByListParentID(parentId);
      if (listChildCateg.length > 0) {
        listResult += await this.getAllCategoryIDByListParentID(
            listChildCateg.map((item) => item.id).toList());
      }
    }
    print('listChild$listResult');
    return listResult;
  }

//Tìm và lấy tất cả danh sách  category con từ danh sách parent id 1-3
  Future<List<PosCategory>> getAllCategoryByListParentID(
      List<PosCategory> listParentID) async {
    var listResult = listParentID;
    for (var i = 0; i < listParentID.length; i++) {
      var parentId = listParentID[i].id;
      var listChildCateg = await this.getCategoryByListParentID(parentId);
      if (listChildCateg.length > 0) {
        listResult += await this.getAllCategoryByListParentID(listChildCateg);
      }
    }
    print('listChild$listResult');
    return listResult;
  }

  //Lấy danh sách product từ  list category id
  Future<List<Product>> getProductByCatID(List<int> id) async {
    await this.authorization();
    body = new Map();
    body["fields"] = [
      'name',
      'categ_id',
      'cost_currency_id',
      'list_price',
      'uom_id',
      'weight_uom_name'
    ];
    body["order"] = "name";
    body["domain"] = [
      ['sale_ok', '=', true],
      ['available_in_pos', '=', true],
      [
        'pos_categ_id',
        'in',
        id,
      ]
    ];
    body["limit"] = 0;
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/product.product?$params',
            headers: this.headers)
        .then((http.Response response) {
      List<Product> listResult = new List();
      if (response.statusCode == 200) {
        print(response.body);
        List list = json.decode(response.body);
        if (list.length > 0)
          listResult = list.map((item) => Product.fromJson(item)).toList();
        print('List Product: $list');
      }
      return listResult;
    });
  }

  //Lấy image của product theo id
  Future<String> getImageProductByID(int id, TypeImage typeImage) async {
    await this.authorization();
    body = new Map();
    var _typeImage = '';
    switch (typeImage) {
      case TypeImage.SMALL:
        _typeImage = 'image_small';
        break;
      case TypeImage.MEDIUM:
        _typeImage = 'image_medium';
        break;
      case TypeImage.ORIGINAL:
        _typeImage = 'image';
        break;
      default:
    }
    body['fields'] = [_typeImage];
    body["domain"] = [
      ['id', "=", id]
    ];
    body["limit"] = 0;
    var params = convertSerialize(body);
    return http
        .get('${this.api}/search_read/product.product?$params',
            headers: this.headers)
        .then((http.Response response) {
      var result = "";
      if (response.statusCode == 200) {
        print(response.body);
        List list = json.decode(response.body);
        result = list[0][_typeImage];
        //print(list);
      }
      return result;
    });
  }

  //Lấy danh sách tất cả category cha từ id con.
  List<PosCategory> getListParentCategoryByChild(
      int childID, List<PosCategory> listCategory) {
    var listResult = List<PosCategory>();
    for (var i = 0; i < listCategory.length; i++) {
      var itemCurrent = listCategory[i];
      if (itemCurrent.id == childID) {
        var categoryParent = listCategory.where((item) {
          if (itemCurrent.parentId is List)
            return item.id == itemCurrent.parentId[0];
          else if (itemCurrent.parentId is bool) {
            if (!itemCurrent.parentId) return item.id == itemCurrent.id;
          }
          return false;
        });
        if (categoryParent.length > 0) {
          listResult += categoryParent.toList();
          if (categoryParent.toList()[0].parentId is List) {
            listResult += this.getListParentCategoryByChild(
                categoryParent.toList()[0].id, listCategory);
            listResult += [itemCurrent];
          }
        }
      }
    }
    return listResult;
  }
}
