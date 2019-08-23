import 'dart:core';

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SaleTicketPage extends StatefulWidget {
  static const String routeName = "/saleTicket";
  @override
  _SaleTicketPageState createState() => _SaleTicketPageState();
}

class _SaleTicketPageState extends State<SaleTicketPage> {
  SaleTicketViewModel viewModel = SaleTicketViewModel();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: _appBar(viewModel),
              // appBar: AppBar(
              //   flexibleSpace: Column(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       TabBar(
              //         tabs: [
              //           Tab(icon: Icon(Icons.directions_car)),
              //           Tab(icon: Icon(Icons.directions_transit)),
              //           Tab(icon: Icon(Icons.directions_bike)),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              body: SaleTicketBodyWidget(),
            );
          }),
    );
  }

  Widget _appBar(SaleTicketViewModel viewModel) => GradientAppBar(
        title: Text("Bán vé"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
        // bottom: TabBar(
        //   tabs: <Widget>[Text('Một'), Text('Hai')],
        // ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: Text(
              "Lưu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
}
// class SaleTicketPage extends StatelessWidget {
//   static const String routeName = "/saleTicket";

//   @override
//   Widget build(BuildContext context) {
//     SaleTicketViewModel viewModel = SaleTicketViewModel();

//     return ViewModelProvider(
//       viewmodel: viewModel,
//       child: StreamBuilder<Object>(
//           stream: viewModel.stream,
//           builder: (context, snapshot) {
//             return Scaffold(
//               appBar: _appBar(viewModel),
//               // appBar: AppBar(
//               //   flexibleSpace: Column(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     children: [
//               //       TabBar(
//               //         tabs: [
//               //           Tab(icon: Icon(Icons.directions_car)),
//               //           Tab(icon: Icon(Icons.directions_transit)),
//               //           Tab(icon: Icon(Icons.directions_bike)),
//               //         ],
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               body: SaleTicketBodyWidget(),
//             );
//           }),
//     );
//   }

//   Widget _appBar(SaleTicketViewModel viewModel) => GradientAppBar(
//         title: Text("Bán vé"),
//         backgroundColorStart: Colors.blue,
//         backgroundColorEnd: Color(0Xff135691),
//         // bottom: TabBar(
//         //   tabs: <Widget>[Text('Một'), Text('Hai')],
//         // ),
//         actions: <Widget>[
//           FlatButton(
//             textColor: Colors.white,
//             onPressed: () {},
//             child: Text(
//               "Lưu",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
//           ),
//         ],
//       );
// }

class SaleTicketBodyWidget extends StatefulWidget {
  @override
  _SaleTicketBodyWidgetState createState() => _SaleTicketBodyWidgetState();
}

class _SaleTicketBodyWidgetState extends State<SaleTicketBodyWidget> {
  SaleTicketViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    viewModel = ViewModelProvider.of(context);
    return Container(
      // padding: EdgeInsets.only(top: 32),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: isPortrait == true ? 1 : 2,
            child:
          Container(
            // color: Colors.amber,
            // height: MediaQuery.of(context).size.height - 8,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: TextField(
                    onChanged: viewModel.filterSearchResults,
                    controller: viewModel.searchController,
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: isPortrait == true ? 2 : 3,
                    childAspectRatio: (itemWidth / itemWidth),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: viewModel.listChooseEat.map((item) {
                      return GestureDetector(
                        onTap: () {
                          viewModel.addEat(item);
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: Colors.green,
                              margin: EdgeInsets.all(1.0),
                              child: Center(
                                child: Text(
                                  item['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                   _listViewEat(context),
                  Container(
                    child: Column(
                      children: <Widget>[
                        // Divider(),
                        Container(
                          height: 40,
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            '${viewModel.formatter.format(viewModel.total)}đ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: size.width,
                          height: 40,
                          child: RaisedButton(
                            child: Text(
                              "Thanh toán",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            color: Colors.red,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget InfoCardEat(String name, int number, int price, BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(4),
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 4, right: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text('x${number}'),
            ),
            Container(
              child: Text('${viewModel.formatter.format(price)}đ'),
            )
          ],
        ),
      ),
      Divider(),
    ],
  );
}

Widget _listViewEat(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  return Expanded(
    child: ListView.builder(
      itemCount: viewModel.eat.length,
      itemBuilder: (context, index) {
        return InfoCardEat(
            viewModel.eat[index]['name'],
            viewModel.eat[index]['number'],
            viewModel.eat[index]['price'],
            context);
      },
    ),
  );
}
