import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page_viewmodel.dart';

class TabsCheckViewModel extends ViewModelBase {
  CheckTicketViewModel checkTicketViewModel;
  CheckTicketHistoryModel checkTicketHistoryModel;
  TabsCheckViewModel() {
    checkTicketViewModel = CheckTicketViewModel();
    checkTicketHistoryModel = CheckTicketHistoryModel();
  }

  updateStateWhenConfirmTicket() {
    checkTicketViewModel.conFirmTicket();
    checkTicketHistoryModel.ticketInfo.getListInfo();
    checkTicketHistoryModel.sink.add(true);
  }
}
