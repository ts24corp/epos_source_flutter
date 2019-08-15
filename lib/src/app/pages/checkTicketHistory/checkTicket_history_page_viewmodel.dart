import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/ticket-info.dart';

class CheckTicketHistoryModel extends ViewModelBase {
  @override
  void dispose() {
    super.dispose();
  }

  TicketInfo ticketInfo;
  CheckTicketHistoryModel() {
    ticketInfo = new TicketInfo();
    ticketInfo.getListInfo().then((_) {
      sink.add(true);
    });
  }
}
