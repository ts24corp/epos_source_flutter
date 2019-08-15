import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/ticket-info.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class CheckTicketViewModel extends ViewModelBase {
  // CheckTicketViewModel();

  BuildContext context;

  String _result = "";
  get result => _result;
  // StreamController _checkTicketController = new StreamController();
  // Stream get checkTicketStream => _checkTicketController.stream;
  // Sink get checkTicketSink => _checkTicketController.sink;

  TicketInfo ticketInfo;
  CheckTicketViewModel() {
    ticketInfo = new TicketInfo();
  }
  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  Future scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      ticketInfo = TicketInfo.fromJson(jsonDecode(qrResult));
      await ticketInfo.getListInfo();
      sink.add(true);
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        _result = "Camera permission was denied";
      } else {
        _result = "Unknown Error $ex";
      }
    } on FormatException {
      _result = "You pressed the back button before scanning anything";
      sink.add(true);
    } catch (ex) {
      _result = "Unknown Error $ex";
    }
  }

  ///Xác nhận vé
  Future conFirmTicket() async {
    ticketInfo.ticketState = "Đã xác nhận";
    await ticketInfo.getListInfo();
    ticketInfo.saveLocal();
    sink.add(true);
  }
}
