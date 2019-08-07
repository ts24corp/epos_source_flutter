import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class CheckTicketViewModel extends ChangeNotifier {
  CheckTicketViewModel();

  String _result = "11";
  get result => _result;
  StreamController _checkTicketController = new StreamController();
  Stream get checkTicketStream => _checkTicketController.stream;

  void dispose() {
    print("dispose");
    super.dispose();
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
    } catch (ex) {
      _result = "Unknown Error $ex";
    }
  }
}
