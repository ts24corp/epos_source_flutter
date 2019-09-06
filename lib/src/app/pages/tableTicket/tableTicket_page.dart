import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/tableTicket/tableTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class TableTicketPage extends StatefulWidget {
  static const String routeName = '/tableTicket';

  @override
  _TableTicketPageState createState() {
    return _TableTicketPageState();
  }
}

class _TableTicketPageState extends State<TableTicketPage> {
  TableTicketViewModel viewModel = TableTicketViewModel();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(viewModel.listTable);
    return ViewModelProvider(
      viewmodel: viewModel,
      child: Scaffold(
        appBar: _appBar(viewModel),
        body: TableTicketBodyWidget(),
      ),
    );
  }

  Widget _appBar(TableTicketViewModel viewModel) => GradientAppBar(
        title: Text("Table Ticket Page"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
      );
}

class TableTicketBodyWidget extends StatefulWidget {
  TableTicketBodyWidget({Key key}) : super(key: key);

  @override
  _TableTicketBodyWidgetState createState() {
    return _TableTicketBodyWidgetState();
  }
}

class _TableTicketBodyWidgetState extends State<TableTicketBodyWidget> {
  TableTicketViewModel viewModel;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var listtable = viewModel.listTable;
    print(viewModel);
    return SafeArea(
      child: GridView.builder(
          itemCount: listtable.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (isPortrait == true ? 2 : 3),
            childAspectRatio: (itemWidth / itemWidth),
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: listtable[index]['status'] == true
                    ? Colors.orange
                    : Colors.blue,
                border: Border.all(
                    color: listtable[index]['status'] == true
                        ? Colors.lightBlue
                        : Colors.blue,
                    width: 8),
                borderRadius: listtable[index]['status'] == true
                    ? null
                    : BorderRadius.all(Radius.circular(18)),
                shape: listtable[index]['status'] == true
                    ? BoxShape.circle
                    : BoxShape.rectangle,
              ),
              child: Text(
                listtable[index]['name'],
                style: TextStyle(fontSize: 40,color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          }),
    );
  }
}
