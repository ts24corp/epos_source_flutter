import 'dart:convert';

import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:intl/intl.dart';

class TicketInfo {
  int ticketPrice = 590000;
  String companyName = "";
  String ticketName = "";
  String ticketType = "";
  int ticketAdultQuantity = 0;
  int ticketChildQuantity = 0;
  String ticketCustomer = "VƯƠNG MINH LUÂN";
  String ticketId = "1121908120010104651614-1";
  String ticketDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String ticketState = "";
  TicketInfo() {
    getListInfo();
  }

  static String aliasName = "listTicketInfo";
  TicketInfo.fromJson(Map<String, dynamic> json) {
    ticketPrice = json['ticket_price'];
    companyName = json['company_name'];
    ticketName = json['ticket_name'];
    ticketType = json['ticket_type'];
    ticketAdultQuantity = json['ticket_adult_quantity'];
    ticketChildQuantity = json['ticket_child_quantity'];
    ticketCustomer = json['ticket_customer'];
    ticketId = json['ticket_id'];
    ticketDate = json['ticket_date'];
    ticketState = json['ticket_state'];
  }

  TicketInfo.fromJsonList(List<Map<String, dynamic>> jsonList) {
    jsonList.forEach((e) {});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_price'] = this.ticketPrice;
    data['company_name'] = this.companyName;
    data['ticket_name'] = this.ticketName;
    data['ticket_type'] = this.ticketType;
    data['ticket_adult_quantity'] = this.ticketAdultQuantity;
    data['ticket_child_quantity'] = this.ticketChildQuantity;
    data['ticket_customer'] = this.ticketCustomer;
    data['ticket_id'] = this.ticketId;
    data['ticket_date'] = this.ticketDate;
    data['ticket_state'] = this.ticketState;
    return data;
  }

  List<TicketInfo> listTicketInfo = new List();

  Future<void> saveLocal() async {
    listTicketInfo.add(this);
    localStorage.setItem("listTicketInfo", json.encode(listTicketInfo));
  }

  List<TicketInfo> getListInfo() {
    if (localStorage.getItem("listTicketInfo") != null) {
      var _listTicketInfo =
          jsonDecode(localStorage.getItem(TicketInfo.aliasName));
      listTicketInfo = List<TicketInfo>.from(
          _listTicketInfo.map((i) => TicketInfo.fromJson(i)));
      print(listTicketInfo);
    }
    return listTicketInfo;
  }
}
