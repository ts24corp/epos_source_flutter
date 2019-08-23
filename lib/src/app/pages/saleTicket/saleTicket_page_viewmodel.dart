import 'dart:async';

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class SaleTicketViewModel extends ViewModelBase {
  BuildContext context;
  StreamController streamAddController = new StreamController();
  final formatter = new NumberFormat("#,###");
  TextEditingController searchController = TextEditingController();
  List<dynamic> listChooseEat = new List<dynamic>();
  List eat = [];
  var total = 0;

  Future addEat(item) async {
    var index = eat.indexWhere((value) => value["id"] == item['id']);
    print('INDEX${index}');
    if (index != -1) {
      eat[index]['number'] = eat[index]['number'] + 1;
    } else
      eat.add(item);
    total = total + item['price'];
    // await print(total);
    sink.add(true);
  }

  SaleTicketViewModel() {
    listChooseEat.addAll(widgetList);
  }
  var iteamsSearch = List<dynamic>();
  void filterSearchResults(String value) {
    List<dynamic> tempwidgetList = List<dynamic>();
    tempwidgetList.addAll(widgetList);
    if (value.isNotEmpty) {
      List<dynamic> tempListData = List<dynamic>();
      tempwidgetList.forEach((f) {
        if (f['name'].contains(new RegExp(value))) {
          print(f);
          tempListData.add(f);
        }
      });
      listChooseEat.clear();
      listChooseEat.addAll(tempListData);
      print(' LISST ITEMS${listChooseEat}s');
      sink.add(true);
      return;
    } else {
      listChooseEat.clear();
      listChooseEat.addAll(widgetList);
      sink.add(true);
    }
  }

  List<dynamic> widgetList = [
    {
      'id': 1,
      'name': "Bún thịt nướng",
      'type': 'quan',
      "price": 20000,
      "number": 1
    },
    {'id': 2, 'name': "Bún bò Huế", 'type': 'nha', "price": 20000, "number": 1},
    {
      'id': 3,
      'name': "Cháo nhân sâm",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 4,
      'name': "Thịt bò xào",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 5,
      'name': "Cơm gà chiên",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 6,
      'name': "Cơm dương châu",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 7,
      'name': "Vịt nướng lu",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {'id': 8, 'name': "Hủ tiếu bò", 'type': 'nha', "price": 20000, "number": 1},
    {
      'id': 9,
      'name': "Mì xào bò thập cẩm",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 10,
      'name': "Chè thập cẩm",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 11,
      'name': "Cháo thập cẩm",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 12,
      'name': "Mì ăn liền",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
    {
      'id': 13,
      'name': "Cơm hải sản",
      'type': 'nha',
      "price": 20000,
      "number": 1
    },
  ];
  void dispose() {
    streamAddController.close();
  }
}
