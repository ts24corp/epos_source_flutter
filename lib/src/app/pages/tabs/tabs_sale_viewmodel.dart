import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/placeTicket/placeTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/placeTicket/placeTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicketHistory/saleTicketHistory_viewmodel.dart';

class TabsSaleViewModel extends ViewModelBase {
  // SaleTicketViewModel saleTicketViewModel;
  PlaceTicketViewModel placeTicketViewModel;
  SaleTicketHistoryViewModel saleTicketHistoryViewModel;
  TabsSaleViewModel() {
    // saleTicketViewModel = new SaleTicketViewModel();
    placeTicketViewModel = new PlaceTicketViewModel();
    saleTicketHistoryViewModel = new SaleTicketHistoryViewModel();
  }
}
