import 'dart:async';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class CheckTicketViewModel extends ViewModelBase {
  CheckTicketViewModel();

  BuildContext context;

  String _result = "11";
  get result => _result;
  StreamController _checkTicketController = new StreamController();
  Stream get checkTicketStream => _checkTicketController.stream;

  @override
  void dispose() {
    print("dispose");
    _checkTicketController.close();
  }

  Future scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      _result = qrResult;
      _checkTicketController.sink.add(true);
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        _result = "Camera permission was denied";
      } else {
        _result = "Unknown Error $ex";
      }
    } on FormatException {
      _result = "You pressed the back button before scanning anything";
      _checkTicketController.sink.add(true);
    } catch (ex) {
      _result = "Unknown Error $ex";
    }
  }
}
