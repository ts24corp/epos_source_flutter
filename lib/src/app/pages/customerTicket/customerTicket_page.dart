import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/addCustomer/addCustomer_page.dart';
import 'package:epos_source_flutter/src/app/pages/customerTicket/customerTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CustomerTicketPage extends StatefulWidget {
  static const String routeName = '/customerTicket';

  @override
  _CustomerTicketPageState createState() {
    return _CustomerTicketPageState();
  }
}

class _CustomerTicketPageState extends State<CustomerTicketPage> {
  CustomerTickerViewModel viewModel = CustomerTickerViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: _appBar(viewModel),
              body: CustomerTicketBodyWidget(),
            );
          }),
    );
  }

  Widget _appBar(CustomerTickerViewModel viewModel) => GradientAppBar(
        title: Text(translation.text("CUSTOMER_TICKET.CUSTOMER_TICKET")),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
//              Navigator.pushNamed(context, AddCustomerPage.routeName);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      maintainState: false,
                      fullscreenDialog: true,
                      builder: (context) => AddCustomerPage()));

//              _settingModalBottomSheet(context);
            },
            child: Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
}

class CustomerTicketBodyWidget extends StatefulWidget {
  @override
  _CustomerTicketBodyWidgetState createState() {
    return _CustomerTicketBodyWidgetState();
  }
}

class _CustomerTicketBodyWidgetState extends State<CustomerTicketBodyWidget> {
  CustomerTickerViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    var listCustomer = viewModel.listResultsCustomer;
//    var listCustomer = viewModel.loadListCustomer;
    return StatefulWrapper(
      onInit: () {
        viewModel.loadData();
      },
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: EdgeInsets.only(left: 4, right: 4),
                child: TextField(
                  onChanged: viewModel.filterSearchResults,
                  controller: viewModel.onSearchController,
                  decoration: InputDecoration(
                    hintText: translation.text("CUSTOMER_TICKET.SEARCH"),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    suffixIcon: viewModel.onSearchController.text == ''
                        ? null
                        : IconButton(
                            icon: Icon(
                              Icons.clear,
                              size: 20,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              viewModel.onClearSearch();
                            },
                          ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listCustomer.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: ValueKey(index),
                        actionPane: SlidableStrechActionPane(),
                        actionExtentRatio: 0.25,
//                        direction: Axis.vertical,
                        secondaryActions: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                            child: IconSlideAction(
                              caption: 'Edit',
                              color: Colors.orange,
                              icon: Icons.edit,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCustomerPage(customer: listCustomer[index]),
                                    ));
                              },
                            ),
                          ),
                        ],
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              viewModel.onCustomer(index);
                            },
                            title: Text(
                              listCustomer[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              listCustomer[index].contactAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            trailing: Text(
                              listCustomer[index].phone != false
                                  ? listCustomer[index].phone.toString()
                                  : '',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//void _settingModalBottomSheet(context) {
//  showModalBottomSheet(
//      context: context,
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(10.0),
//      ),
//      isScrollControlled: true,
//      builder: (BuildContext context) {
//        return Container(
//          height: MediaQuery.of(context).size.height * 0.9,
//          child: Scaffold(
//            appBar: AppBar(
//              title: Text('title'),
//            ),
//            body: Container(
//              child: new Column(
//                children: <Widget>[
//                  new ListTile(
//                      leading: new Icon(Icons.music_note),
//                      title: new Text('Music'),
//                      onTap: () => {}),
//                  new ListTile(
//                    leading: new Icon(Icons.videocam),
//                    title: new Text('Video'),
//                    onTap: () => {},
//                  ),
//                ],
//              ),
//            ),
//          ),
//        );
//      });
//}
