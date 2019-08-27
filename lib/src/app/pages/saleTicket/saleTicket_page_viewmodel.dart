import 'dart:async';

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
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
    // print('INDEX$index');
    if (index != -1) {
      eat[index]['number'] = eat[index]['number'] + 1;
    } else
      eat.add(item);
    total = total + item['price'];
    // await print(total);
    sink.add(true);
  }

  Future numberTicketIncrease(dynamic item) async {
    var index = eat.indexWhere((value) => value["id"] == item['id']);
    if (index != -1) {
      eat[index]['number'] = eat[index]['number'] + 1;
    } else
      eat.add(item);
    total = total + item['price'];
    sink.add(true);
  }

  Future numberTicketDecrease(dynamic item) async {
    var index = eat.indexWhere((value) => value["id"] == item['id']);
    if (index != -1) {
      if (item['number'] == 1) {
        eat.removeWhere((i) => i['id'] == item['id']);
      } else
        eat[index]['number'] = eat[index]['number'] - 1;
      total = total - item['price'];
    }
    sink.add(true);
  }

  Future onTab(index) async {
    print(choices[index].title);
    print(choices[index]);
  }

  SaleTicketViewModel() {
    listChooseEat.addAll(widgetList);
  }
  var iteamsSearch = List<dynamic>();
  void filterSearchResults(String value) async {
    print('Value $value');
    List<dynamic> tempwidgetList = List<dynamic>();
    tempwidgetList.addAll(widgetList);
    if (value.isNotEmpty) {
      List<dynamic> tempListData = List<dynamic>();
      tempwidgetList.forEach((f) {
        if (Common.sanitizing(f['name']).contains(Common.sanitizing(value))) {
          tempListData.add(f);
        }
      });
      listChooseEat.clear();
      listChooseEat.addAll(tempListData);
      print(' LISST ITEMS$listChooseEat');
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
      "price": 100000,
      "number": 1
    },
    {'id': 2, 'name': "Bún bò Huế", 'type': 'nha', "price": 50000, "number": 1},
    {
      'id': 3,
      'name': "Cháo nhân sâm",
      'type': 'nha',
      "price": 40000,
      "number": 1
    },
    {
      'id': 4,
      'name': "Thịt bò xào",
      'type': 'nha',
      "price": 200000,
      "number": 1
    },
    {
      'id': 5,
      'name': "Cơm gà chiên",
      'type': 'nha',
      "price": 270000,
      "number": 1
    },
    {
      'id': 6,
      'name': "Cơm dương châu",
      'type': 'nha',
      "price": 209000,
      "number": 1
    },
    {
      'id': 7,
      'name': "Vịt nướng lu",
      'type': 'nha',
      "price": 201000,
      "number": 1
    },
    {'id': 8, 'name': "Hủ tiếu bò", 'type': 'nha', "price": 20000, "number": 1},
    {
      'id': 9,
      'name': "Mì xào bò thập cẩm",
      'type': 'nha',
      "price": 12000,
      "number": 1
    },
    {
      'id': 10,
      'name': "Chè thập cẩm",
      'type': 'nha',
      "price": 10000,
      "number": 1
    },
    {
      'id': 11,
      'name': "Cháo thập cẩm",
      'type': 'nha',
      "price": 14000,
      "number": 1
    },
    {
      'id': 12,
      'name': "Mì ăn liền",
      'type': 'nha',
      "price": 178000,
      "number": 1
    },
    {
      'id': 13,
      'name': "Cơm hải sản",
      'type': 'nha',
      "price": 136000,
      "number": 1
    },
  ];
  List<dynamic> catelogyProduct = [
    {
      'id': 1,
      'type': 'Do uong',
      'name': 'Đồ uống',
    },
    {
      'id': 2,
      'type': 'Nha hang',
      'name': 'Nhà hàng',
    },
    {
      'id': 3,
      'type': 'Thuc an',
      'name': 'Thức ăn',
    },
    {
      'id': 4,
      'type': 'Do go',
      'name': 'Đồ gỗ',
    },
    {
      'id': 5,
      'type': 'Linh kien',
      'name': 'Linh kiện',
    },
    {
      'id': 6,
      'type': 'May tinh',
      'name': 'Máy tính',
    },
    {
      'id': 7,
      'type': 'Spa',
      'name': 'Spa',
    },
    {
      'id': 8,
      'type': 'Do gia dung',
      'name': 'Đồ gia dụng',
    }
  ];
  void dispose() {
    streamAddController.close();
  }
}

class Choice {
  const Choice({this.title, this.icon, this.id});

  final String title;
  final IconData icon;
  final int id;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Đồ uống', id: 1),
  const Choice(title: 'Nhà hàng', id: 2),
  const Choice(title: 'Thức ăn', id: 3),
  const Choice(title: 'Đồ gỗ', id: 4),
  const Choice(title: 'Linh kiện', id: 5),
  const Choice(title: 'Máy tính', id: 6),
  const Choice(title: 'Spa', id: 7),
  const Choice(title: 'Đồ gia dụng', id: 8),
  const Choice(title: 'Đồ gia dụng', id: 8),
  const Choice(title: 'Đồ gia dụng', id: 8),
  const Choice(title: 'Đồ gia dụng', id: 8),
];
