import 'dart:convert';

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
//import 'package:epos_source_flutter/src/app/helper/callAPI.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerTickerViewModel extends ViewModelBase {
  TextEditingController _onSearchController = TextEditingController();

  get onSearchController => _onSearchController;

  List<Post> loadListTemp = new List();

  Future loadData() async {
    loadListTemp = await fetchPost();
    var res = loadListTemp.map((e) {
      print(e);
      return e.id;
    });
    print('RE: $res');
    this.updateState();
  }

  CustomerTickerViewModel() {
    listResultsCustomer.addAll(listCustomer);
    loadData();
//    fetch();
  }

  Future<void> onCustomer(index) async {
    print(listCustomer[index]);
  }

  List<dynamic> listResultsCustomer = [];

  Future<void> filterSearchResults(String value) async {
    listResultsCustomer.clear();
    print('Value $value');
    List<dynamic> tempwidgetList = List<dynamic>();
    tempwidgetList.addAll(listCustomer);
    if (value.isNotEmpty) {
      List<dynamic> tempListData = List<dynamic>();
      tempwidgetList.forEach((f) {
        if (Common.sanitizing(f['address'])
                .contains(Common.sanitizing(value)) ||
            Common.sanitizing(f['name']).contains(Common.sanitizing(value)) ||
            Common.sanitizing(f['phone']).contains(Common.sanitizing(value))) {
          tempListData.add(f);
        }
      });
      listResultsCustomer.clear();
      listResultsCustomer.addAll(tempListData);
      print(' LISST ITEMS$listResultsCustomer');
      sink.add(true);
      return;
    } else {
      listResultsCustomer.clear();
      listResultsCustomer.addAll(listCustomer);
      sink.add(true);
    }
  }

  List<dynamic> listCustomer = [
    {
      'id': 1,
      'name': 'Nguyễn Văn A',
      'phone': '0456456456',
      'address': '66 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 2,
      'name': 'Nguyễn Văn B',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 3,
      'name': 'Nguyễn Văn C',
      'phone': '0987654321',
      'address': '77 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 4,
      'name': 'Nguyễn Văn D',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 5,
      'name': 'Nguyễn Văn E',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 6,
      'name': 'Nguyễn Văn F',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 7,
      'name': 'Nguyễn Văn G',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 8,
      'name': 'Nguyễn Văn H',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 9,
      'name': 'Nguyễn Văn J',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    },
    {
      'id': 10,
      'name': 'Nguyễn Văn K',
      'phone': '0987654321',
      'address': '55 Tôn đức thắng - Phường 3 - Quận 1 - TP Hồ chí minh'
    }
  ];
}

Future<List<Post>> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');
  List<Post> listResult = List();
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print('RESS:: ${response.body}');
    List list = json.decode(response.body);
    listResult = list.map((i) => Post.fromJson(i)).toList();
    return listResult;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

//NetworkUtil _netUtil = new NetworkUtil();

//Future<dynamic> fetch() {
////  String BASE_TOKEN_URL = NetworkUtil.BASE_URL;
//  return _netUtil.get(BASE_TOKEN_URL).then((dynamic res) {
//    List<Post> list = res.map<Post>((i) => new Post.fromJson(i)).toList();
//    print('HIHIHIHI: $list');
//    return list;
//  });
//}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
