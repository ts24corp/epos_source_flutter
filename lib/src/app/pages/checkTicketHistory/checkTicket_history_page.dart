import 'package:date_format/date_format.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CheckTicketHistoryPage extends StatelessWidget {
  static const String routeName = "/checkTicketHistory";
  const CheckTicketHistoryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TabsCheckViewModel viewModel = ViewModelProvider.of(context);
    var checkTicketHistoryModel = viewModel.checkTicketHistoryModel;
    return ViewModelProvider(
      viewmodel: checkTicketHistoryModel,
      child: StreamBuilder<Object>(
          stream: checkTicketHistoryModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
                appBar: GradientAppBar(
                  title: Text("Lịch sử"),
                  backgroundColorStart: Colors.blue,
                  backgroundColorEnd: Color(0Xff135691),
                ),
                body: CTHBodyWidget());
          }),
    );
  }
}

class CTHBodyWidget extends StatefulWidget {
  @override
  _CTHBodyWidgetState createState() => _CTHBodyWidgetState();
}

class _CTHBodyWidgetState extends State<CTHBodyWidget> {
  //CheckTicketViewModel viewModel;
  CheckTicketHistoryModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    //viewModel.ticketInfo.listTicketInfo = viewModel.ticketInfo.getListInfo();
    var _listTicket = viewModel.ticketInfo.listTicketInfo;
    return ListView.builder(
        itemCount: _listTicket.length,
        itemBuilder: (context, i) {
          //print(index);

          //   return ListTile(
          //     title: Text("$index"),
          //     subtitle:
          //         Text(viewModel.ticketInfo.listTicketInfo[index].ticketCustomer),
          //   );

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 2,
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: rowTicketInfo(
                        label: "Mã đặt vé", value: _listTicket[i].ticketId),
                  ),
                  rowTicketInfo(
                      label: "Khách hàng",
                      value: _listTicket[i].ticketCustomer),
                  rowTicketInfo(
                      label: "Ngày giờ",
                      value: formatDate(
                          DateTime.parse(_listTicket[i].ticketDate),
                          [dd, '-', mm, '-', yyyy])),
                  rowTicketInfo(
                      label: "Sự kiện", value: _listTicket[i].ticketName),
                  rowTicketInfo(
                      label: "Loại vé", value: _listTicket[i].ticketType),
                  (_listTicket[i].ticketAdultQuantity != null &&
                          _listTicket[i].ticketAdultQuantity > 0)
                      ? rowTicketInfo(
                          label: "S/L người lớn",
                          value: _listTicket[i].ticketAdultQuantity.toString())
                      : Container(),
                  (_listTicket[i].ticketChildQuantity != null &&
                          _listTicket[i].ticketChildQuantity > 0)
                      ? rowTicketInfo(
                          label: "S/L trẻ em",
                          value: _listTicket[i].ticketChildQuantity.toString())
                      : Container(),
                  // rowTicketInfo(
                  //     label: "Đơn giá",
                  //     value:
                  //         '₫' + Common.formatMoney(_listTicket[i].ticketPrice)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: rowTicketInfo(
                        label: "Tình trạng",
                        value: _listTicket[i].ticketState,
                        lastIndex: true),
                  ),
                ])),
          );
        });
  }

  Widget rowTicketInfo({String label, String value, bool lastIndex = false}) =>
      Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  label,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(value,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
        ),
        lastIndex == false
            ? Divider(
                color: Color(0xffdcdcde),
                indent: 7,
              )
            : Container()
      ]);
}
