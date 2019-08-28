import 'dart:convert';

import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/helper/validator.dart';

class ConfigDomain {
  String domain;
  String clientID;
  String clientSecret;
  static String aliasName = "ConfigDomain";

  static final ConfigDomain _singleton = new ConfigDomain._internal();

  factory ConfigDomain() {
    return _singleton;
  }

  ConfigDomain._internal();

  ConfigDomain.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    clientID = json['clientID'];
    clientSecret = json['clientSecret'];
  }

  fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    clientID = json['clientID'];
    clientSecret = json['clientSecret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domain'] = this.domain;
    data['clientID'] = this.clientID;
    data['clientSecret'] = this.clientSecret;
    return data;
  }

  Future<dynamic> saveLocal() async {
    return localStorage.setItem(ConfigDomain.aliasName, json.encode(this));
  }

  Future<ConfigDomain> reloadData() async {
    bool ready = await localStorage.ready;
    if (ready) {
      if (localStorage.getItem(ConfigDomain.aliasName) != null) {
        print(jsonDecode(localStorage.getItem(ConfigDomain.aliasName)));
        this.fromJson(jsonDecode(localStorage.getItem(ConfigDomain.aliasName)));

        return this;
      }
    }
    return this;
  }

  Future<bool> checkValidDomain() async {
    await reloadData();
    var result = Validator.validateURL(this.domain);
    if (result != null) return false;
    return true;
  }
}
