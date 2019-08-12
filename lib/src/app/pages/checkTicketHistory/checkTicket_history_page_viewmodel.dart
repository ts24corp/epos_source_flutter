import 'dart:async';

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/ticket-info.dart';

class CheckTicketHistoryModel extends ViewModelBase {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listTicketInfoController.close();
  }

  final StreamController listTicketInfoController =
      new StreamController<List<TicketInfo>>();
  Stream get listTicketInfoStream => listTicketInfoController.stream;
  Sink get listTicketInfoSink => listTicketInfoController.sink;
  CheckTicketHistoryModel() {
    listTicketInfoSink.add(ticketInfo.getListInfo());
  }
  TicketInfo ticketInfo = TicketInfo();

  CheckTicketHistoryModel.updateState() {
    listTicketInfoSink.add(ticketInfo.getListInfo());
  }
}
