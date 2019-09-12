import 'dart:async';
import 'dart:core';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/index.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
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
      // ticketInfo = TicketInfo.fromJson(jsonDecode(qrResult));
      ticketInfo = new TicketInfo();
      SuoiTienModel st = SuoiTienModel();
      bool checkMaVe = st.checkMaVe(qrResult);
      if (checkMaVe) {
        st.getObjectFromQRCode(qrResult);
        st.convertCodeToTicketInfo(ticketInfo);
        await ticketInfo.getListInfo();
        var checkExist = ticketInfo.checkExists();
        if (checkExist) ticketInfo.ticketState = "Đã xác nhận";
        sink.add(true);
      } else
        return LoadingDialog.showMsgDialog(context, "Mã soát vé không hợp lệ");
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
    var checkExist = ticketInfo.checkExists();
    if (checkExist) {
      return LoadingDialog.showMsgDialog(
          context, "Vé này đã xác nhận.Vui lòng thử lại.");
    } else
      ToastController.show(
          context: context,
          duration: Duration(milliseconds: 1000),
          message: "xác nhận thành công");
    ticketInfo.saveLocal();
    sink.add(true);
  }
}
