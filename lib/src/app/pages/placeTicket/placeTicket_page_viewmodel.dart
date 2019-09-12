import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:epos_source_flutter/src/app/model/pos-config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlaceTicketViewModel extends ViewModelBase {
  BuildContext context;

  List<dynamic> placeList = [
    {
      'id': 1,
      'placeName': 'Hải Phòng',
      'status': true,
    },
    {
      'id': 2,
      'placeName': 'Quảng Nam',
      'status': true,
    },
    {
      'id': 3,
      'placeName': 'Đà Nẵng',
      'status': false,
    },
    {
      'id': 4,
      'placeName': 'Đà lạt',
      'status': false,
    },
    {
      'id': 5,
      'placeName': 'Vũng tàu',
      'status': true,
    },
    {
      'id': 6,
      'placeName': 'Phú Quốc',
      'status': false,
    },
    {
      'id': 7,
      'placeName': 'Ninh Bình',
      'status': true,
    },
  ];

  List<PosConfig> listPosConfig = new List();
  List<PosCategory> listCategorybyID = List();
  PlaceTicketViewModel() {
//    loadData();
  }

  Future loadData() async {
    listPosConfig = await api.getListPos();
    this.updateState();
//    this.updateState();
    // var listParentID = await api.getAllParentIDCategory();
    // var listCategoryParent = await api.getCategoryByID(listParentID);
    // var listCategory =
    //     await api.getAllCategoryByListParentID(listCategoryParent);
    // var listPreParent =
    //     api.getListParentCategoryByChild(listCategory[12].id, listCategory);
    // print(listPreParent.toString());
  }
}
