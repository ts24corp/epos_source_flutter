import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/customerTicket/customerTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
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
        }
      ),
    );
  }

  Widget _appBar(CustomerTickerViewModel viewModel) => GradientAppBar(
        title: Text("Customer Ticket Page"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
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
    var listPhone = viewModel.loadListTemp;
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
//            height: 50,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              margin: EdgeInsets.only(left: 4, right: 4),
              child: TextField(
              onChanged: viewModel.filterSearchResults,
              controller: viewModel.onSearchController,
                decoration: InputDecoration(
                  hintText: "Tìm kiếm",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      viewModel.onSearchController.text = '';
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: viewModel.loadListTemp.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          viewModel.onCustomer(index);
                        },
                        title: Text(
                          listPhone[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
//                        subtitle: Text(
//                          listCustomer[index]['address'],
//                          maxLines: 1,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.w600),
//                        ),
//                        trailing: Text(
//                          listCustomer[index]['phone'],
//                          style: TextStyle(fontWeight: FontWeight.w600),
//                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
