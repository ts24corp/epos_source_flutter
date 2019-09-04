import 'package:date_format/date_format.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/index.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CheckTicketPage extends StatelessWidget {
  static const String routeName = "/checkTicket";
  const CheckTicketPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TabsCheckViewModel viewModel = ViewModelProvider.of(context);
    var checkTicketViewModel = viewModel.checkTicketViewModel;
    checkTicketViewModel.context = context;
    return ViewModelProvider(
        viewmodel: checkTicketViewModel,
        child: StreamBuilder<Object>(
            stream: checkTicketViewModel.stream,
            builder: (context, snapshot) {
              return Scaffold(
                  appBar: _appBar(viewModel, context),
                  body: CheckTicketBodyWidget(),
                  floatingActionButton:
                      _floatingActionButton(checkTicketViewModel),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat);
            }));
  }

  Widget _appBar(TabsCheckViewModel viewModel, BuildContext context) =>
      GradientAppBar(
        title: Text("Soát vé"),
        backgroundColorStart: Theme.of(context).primaryColor,
        backgroundColorEnd: Color(0Xff135691),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: viewModel.updateStateWhenConfirmTicket,
            child: Text(
              "Xác nhận",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );

  Widget _floatingActionButton(viewModel) => FloatingActionButton.extended(
        icon: Icon(FontAwesomeIcons.qrcode),
        label: Text("Scan"),
        onPressed: viewModel.scanQR,
      );
}

class CheckTicketBodyWidget extends StatefulWidget {
  @override
  _CheckTicketBodyWidgetState createState() => _CheckTicketBodyWidgetState();
}

class _CheckTicketBodyWidgetState extends State<CheckTicketBodyWidget> {
  CheckTicketViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    if (viewModel.ticketInfo.ticketId != "") {
      return SingleChildScrollView(
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            elevation: 2,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: rowTicketInfo(
                    label: "Mã đặt vé", value: viewModel.ticketInfo.ticketId),
              ),
              rowTicketInfo(
                  label: "Khách hàng",
                  value: viewModel.ticketInfo.ticketCustomer),
              rowTicketInfo(
                  label: "Ngày giờ",
                  value: formatDate(
                      DateTime.parse(viewModel.ticketInfo.ticketDate),
                      [dd, '-', mm, '-', yyyy])),
              rowTicketInfo(
                  label: "Sự kiện", value: viewModel.ticketInfo.ticketName),
              rowTicketInfo(
                  label: "Loại vé", value: viewModel.ticketInfo.ticketType),
              (viewModel.ticketInfo.ticketAdultQuantity != null &&
                      viewModel.ticketInfo.ticketAdultQuantity > 0)
                  ? rowTicketInfo(
                      label: "S/L người lớn",
                      value:
                          viewModel.ticketInfo.ticketAdultQuantity.toString())
                  : Container(),
              (viewModel.ticketInfo.ticketChildQuantity != null &&
                      viewModel.ticketInfo.ticketChildQuantity > 0)
                  ? rowTicketInfo(
                      label: "S/L trẻ em",
                      value:
                          viewModel.ticketInfo.ticketChildQuantity.toString())
                  : Container(),
              // rowTicketInfo(
              //     label: "Đơn giá",
              //     value: '₫' +
              //         Common.formatMoney(viewModel.ticketInfo.ticketPrice)),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: rowTicketInfo(
                    label: "Tình trạng",
                    value: viewModel.ticketInfo.ticketState,
                    lastIndex: true),
              ),
            ])),
      );
      // return CardSettings(children: <Widget>[
      //   CardSettingsHeader(label: 'Thông tin vé'),
      //   CardSettingsText(
      //     label: "Mã vé",
      //     labelAlign: TextAlign.left,
      //     contentAlign: TextAlign.center,
      //     hintText: "fff",
      //   )
      // ]);
    } else {
      return Container();
    }
  }

  Widget rowTicketInfo({String label, String value, bool lastIndex = false}) =>
      Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(value,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 18,
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
