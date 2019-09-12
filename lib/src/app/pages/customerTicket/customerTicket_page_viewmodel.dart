import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:flutter/material.dart';

class CustomerTickerViewModel extends ViewModelBase {
  TextEditingController _onSearchController = TextEditingController();

  get onSearchController => _onSearchController;

  List<ResPartner> loadListCustomer = new List();

  Future loadData() async {
    loadListCustomer = await api.getListCustomer();
    listResultsCustomer.addAll(loadListCustomer);
    this.updateState();
  }

  CustomerTickerViewModel() {
    listResultsCustomer.addAll(loadListCustomer);
  }

  Future<void> onCustomer(index) async {
    print(listResultsCustomer[index].name);
  }

  Future onClearSearch() async {
    _onSearchController.text = '';
    listResultsCustomer.addAll(loadListCustomer);
    this.updateState();
  }

  List<ResPartner> listResultsCustomer = List();

  Future<void> filterSearchResults(String value) async {
    listResultsCustomer.clear();
    print('Value $value');
    List<ResPartner> tempWidgetList = List();
    tempWidgetList.addAll(loadListCustomer);
    if (value.isNotEmpty) {
      List<ResPartner> tempListData = List();
      tempWidgetList.forEach((f) {
        if (Common.sanitizing(f.contactAddress)
                .contains(Common.sanitizing(value)) ||
            Common.sanitizing(f.name).contains(Common.sanitizing(value)) ||
            Common.sanitizing(f.phone != false ? f.phone.toString() : '')
                .contains(Common.sanitizing(value))) {
          tempListData.add(f);
        }
      });
      listResultsCustomer.clear();
      listResultsCustomer.addAll(tempListData);
      print(' LISST ITEMS$listResultsCustomer');
      sink.add(true);
    } else {
      listResultsCustomer.clear();
      listResultsCustomer.addAll(loadListCustomer);
      sink.add(true);
    }
  }

}
