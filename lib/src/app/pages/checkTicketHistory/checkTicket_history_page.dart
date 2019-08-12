import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/ticket-info.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CheckTicketHistoryPage extends StatelessWidget {
  static const String routeName = "/checkTicketHistory";
  const CheckTicketHistoryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var viewModel = new CheckTicketHistoryModel();
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
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
    return StreamBuilder<List<TicketInfo>>(
        stream: viewModel.listTicketInfoStream,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                //print(index);

                return ListTile(
                  title: Text("$index"),
                  subtitle: Text(snapshot.data[index].ticketCustomer),
                );
              });
        });
  }
}
