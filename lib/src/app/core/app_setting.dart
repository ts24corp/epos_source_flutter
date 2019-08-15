library appsetting;

import 'package:epos_source_flutter/src/app/repository/api.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage localStorage = new LocalStorage("localStorage");
String domainApi = "http://sales24.odoo24.vn";
Api api = new Api();
