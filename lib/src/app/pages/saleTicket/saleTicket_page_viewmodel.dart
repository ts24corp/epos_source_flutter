import 'dart:async';
import 'dart:typed_data';

import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:epos_source_flutter/src/app/repository/api_parent_01.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleTicketViewModel extends ViewModelBase {
  BuildContext context;
  StreamController streamAddController = new StreamController();
  final formatter = new NumberFormat("#,###");
  TextEditingController searchController = TextEditingController();
  List<Product> eat = List();
  double total = 0;
  int i = 0;

  Future addEat(Product item) async {
    var index = eat.indexWhere((e) => e.id == item.id);
    print('INDEX$index');
    if (index != -1) {
      eat[index].uomId[0] = eat[index].uomId[0] + 1;
      print('eat ${eat[index].uomId}');
    } else
      eat.add(item);
    total = total + item.listPrice;
    this.updateState();
  }

  Future numberTicketIncrease(Product item) async {
    var index = eat.indexWhere((e) => e.id == item.id);
    if (index != -1) {}
    if (index != -1) {
      eat[index].uomId[0] = eat[index].uomId[0] + 1;
    } else
      eat.add(item);
    total = total + item.listPrice;
    sink.add(true);
  }

  Future numberTicketDecrease(Product item) async {
    var index = eat.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      if (item.uomId[0] == 1) {
        eat.removeWhere((i) => i.id == item.id);
      } else
        eat[index].uomId[0] = eat[index].uomId[0] - 1;
      total = total - item.listPrice;
    }
    sink.add(true);
  }

  Future onTab(index) async {
    print(listCategoryByID[index].name);
    print(listCategoryByID[index].childId);
  }

  Future onHome() async {
    listChildCat = listCategoryByID;
    this.updateState();
  }

  void filterSearchResults(String value) async {
    print('Value $value');
    List<Product> tempWidgetList = List();
    tempWidgetList.addAll(listProductIDCatID);
    if (value.isNotEmpty) {
      List<Product> tempListData = List<Product>();
      tempWidgetList.forEach((f) {
        if (Common.sanitizing(f.name).contains(Common.sanitizing(value))) {
          tempListData.add(f);
        }
      });
      listProduct.clear();
      listProduct.addAll(tempListData);
      sink.add(true);
      return;
    } else {
      listProduct.clear();
      listProduct.addAll(listProductIDCatID);
      sink.add(true);
    }
  }

  void dispose() {
    streamAddController.close();
  }

  List<int> listAllCategory = List();
  List<PosCategory> listCategoryByID = List();
  List<int> listCategoryIDByListParentID = List();
  List<Product> listProductIDCatID = List();
  List<PosCategory> listAllCategoryByListParentID = List();
  List<PosCategory> listHomeCat = List();
  List<PosCategory> listChildCat = List();
  List<PosCategory> filterList = List();
  List<Product> listProduct = List();
  List<String> image = List();
  String imageURL = '';
  Uint8List bytesImage;

  Future loadData() async {
    PosCategory home = new PosCategory();
    home.childId = [];
    home.id = 0;
    home.name = 'home';
    home.parentId = false;
    listHomeCat.insert(0, home);

    // Lấy category cha
    listAllCategory = await api.getAllParentIDCategory();
    listCategoryByID = await api.getCategoryByID(listAllCategory);
    listChildCat.addAll(listCategoryByID);
    this.updateState();

    //Lấy product
    listAllCategoryByListParentID =
        await api.getAllCategoryByListParentID(listCategoryByID);
    listCategoryIDByListParentID =
        await api.getAllCategoryIDByListParentID(listAllCategory);
    listProductIDCatID =
        await api.getProductByCatID(listCategoryIDByListParentID);
    listProduct.addAll(listProductIDCatID);
    this.updateState();
    imageURL = await api.getImageProductByID(160, TypeImage.ORIGINAL);
    this.updateState();
  }

  Future onHomeCat(PosCategory item, int index) async {
    PosCategory home = new PosCategory();
    home.childId = [];
    home.id = 0;
    home.name = 'home';
    home.parentId = false;
    print(item.name);
    if (item.name == 'home') {
      listHomeCat.clear();
      listHomeCat.add(home);
      listChildCat.clear();
      listChildCat.addAll(listCategoryByID);
      onFilterProduct(listCategoryIDByListParentID);
      this.updateState();
    } else {
      onRefreshListChild(item.childId);
      if (item.childId.isEmpty) {
        onFilterProductID(item.id);
      } else
        onFilterProduct(item.childId);
      listHomeCat.removeRange(index + 1, listHomeCat.length);
      this.updateState();
    }
  }

  Future onChildCat(PosCategory item, int index) async {
    var ixx = listHomeCat.indexWhere((value) => value.id == item.id);
    print('INDEX$ixx, childId: ${item.childId}');
    if (ixx == -1) {
      listHomeCat.add(item);
      if (item.childId.isEmpty) {
        onFilterProductID(item.id);
      } else
        onFilterProduct(item.childId);
      onRefreshListChild(item.childId);
    }
    this.updateState();
  }

  Future onRefreshListChild(List<dynamic> childId) async {
    List<PosCategory> res = List();
    print('CHildID: $childId');

    listAllCategoryByListParentID.forEach((i) {
      childId.forEach((e) {
        if (e == i.id) {
          res.add(i);
        }
      });
    });
    print('Element: $res');
    listChildCat.clear();
    listChildCat.addAll(res);
    this.updateState();
  }

  Future onFilterProductID(int id) async {
    List<Product> listFilter = List();
    listProductIDCatID.forEach((i) {
      if (id == i.posCategId[0]) {
        listFilter.add(i);
      }
    });
    listProduct.clear();
    listProduct.addAll(listFilter);
    this.updateState();
    print('ListProduct: $listProduct');
  }

  Future onFilterProduct(List<dynamic> childId) async {
    List<Product> listFilter = List();
    childId.forEach((e) {
      listProductIDCatID.forEach((i) {
        if (e == i.posCategId[0]) {
          listFilter.add(i);
        }
      });
    });
    listProduct.clear();
    listProduct.addAll(listFilter);
    this.updateState();
    print('ListProduct: $listProduct');
  }
}
