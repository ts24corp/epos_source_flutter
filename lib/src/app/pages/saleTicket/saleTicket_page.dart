import 'dart:core';

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/payTicket/payTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:flutter/material.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

class SaleTicketPage extends StatefulWidget {
  static const String routeName = "/saleTicket";
  @override
  _SaleTicketPageState createState() => _SaleTicketPageState();
}

class _SaleTicketPageState extends State<SaleTicketPage> {
  SaleTicketViewModel viewModel = SaleTicketViewModel();
  @override
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return DefaultTabController(
              length: choices.length,
              child: Scaffold(
                // appBar: _appBar(viewModel),
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: Container(
                    // padding: kTabLabelPadding,
                    color: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Container()),
                        Container(
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Expanded(
                                child: TabBar(
                                  onTap: (index) {
                                    // print('Tabbar: $index ');
                                    viewModel.onTab(index);
                                  },
                                  indicatorColor: Colors.white,
                                  isScrollable: true,
                                  tabs: choices.map((Choice choice) {
                                    return Tab(
                                      text: choice.title.toUpperCase(),
                                      // icon: Icon(choice.icon),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // bottom: TabBar(
                  //   onTap: (index) {
                  //     // print('Tabbar: $index ');
                  //     viewModel.onTab(index);
                  //   },
                  //   isScrollable: true,
                  //   tabs: choices.map((Choice choice) {
                  //     return Tab(
                  //       text: choice.title,
                  //       // icon: Icon(choice.icon),
                  //     );
                  //   }).toList(),
                  // ),
                  // flexibleSpace: Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TabBar(
                  //       tabs: [
                  //         Tab(icon: Icon(Icons.directions_car)),
                  //         Tab(icon: Icon(Icons.directions_transit)),
                  //         Tab(icon: Icon(Icons.directions_bike)),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
                body: SafeArea(child: SaleTicketBodyWidget()),
              ),
            );
          }),
    );
  }

  // Widget _appBar(SaleTicketViewModel viewModel) => GradientAppBar(
  //       title: Text("Bán vé"),
  //       backgroundColorStart: Colors.blue,
  //       backgroundColorEnd: Color(0Xff135691),
  //       // bottom: TabBar(
  //       //   tabs: <Widget>[Text('Một'), Text('Hai')],
  //       // ),
  //       actions: <Widget>[
  //         FlatButton(
  //           textColor: Colors.white,
  //           onPressed: () {},
  //           child: Text(
  //             "Lưu",
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
  //         ),
  //       ],
  //     );
}
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
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    viewModel = ViewModelProvider.of(context);
    // var _catelogy = viewModel.catelogyProduct;
    return Row(
      children: <Widget>[
        Expanded(
          flex: isPortrait == true ? 1 : 2,
          child: Column(
            children: <Widget>[
              _searchView(context),
              _listChooseEat(context),
            ],
          ),
        ),
        Container(
          height: size.height,
          width: size.width / 300,
          color: Colors.black26,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              _listViewEat(context),
              _viewCommit(context),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _searchView(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  return Container(
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
  );
}

Widget _listChooseEat(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  var size = MediaQuery.of(context).size;
  /*24 is for notification bar on Android*/
  // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  final double itemWidth = size.width / 2;
  var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return Expanded(
    child: GridView.count(
      crossAxisCount: isPortrait == true ? 2 : 3,
      childAspectRatio: (itemWidth / itemWidth),
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(3.0),
      children: viewModel.listChooseEat.map((item) {
        return GestureDetector(
          onTap: () {
            viewModel.addEat(item);
          },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(3),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.black26.withOpacity(0.2),
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  width: size.width,
                  child: Text(
                    '${viewModel.formatter.format(item['price'])}đ',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                        item['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            inherit: true,
                            fontSize: SizeConfig.blockSizeHorizontal * 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // child: Stack(
          //   children: <Widget>[
          //     Container(
          //       color: Colors.green,
          //       margin: EdgeInsets.all(3.0),
          //       child: Center(
          //         child: Text(
          //           item['name'],
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             inherit: true,
          //             fontSize: 25,
          //             color: Colors.black,
          //             fontWeight: FontWeight.bold
          //           ),
          //         ),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.topCenter,
          //       child: Container(
          //         margin: EdgeInsets.all(3.0),
          //         color: Colors.black26.withOpacity(0.2),
          //         padding: EdgeInsets.only(top: 8, bottom: 8),
          //         width: size.width,
          //         child: Text(
          //           '${viewModel.formatter.format(item['price'])}đ',
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        );
      }).toList(),
    ),
  );
}

Widget _viewCommit(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  var size = MediaQuery.of(context).size;
  var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return Container(
    child: Column(
      children: <Widget>[
        // Divider(),
        Container(
          height: isPortrait == true ? size.width / 10 : size.width / 20,
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            '${viewModel.formatter.format(viewModel.total)}đ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: size.width,
          height: isPortrait == true ? size.width / 10 : size.width / 20,
          child: RaisedButton(
            child: Text(
              "Thanh toán",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, PayTicketPage.routeName);
            },
          ),
        ),
      ],
    ),
  );
}

Widget scrollList(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  // var size = MediaQuery.of(context).size;
  /*24 is for notification bar on Android*/
  // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  // final double itemWidth = size.width / 4;
  var _catelogyProduct = viewModel.catelogyProduct;
  return Expanded(
    flex: isPortrait == true ? 1 : 1,
    child: Container(
      color: Colors.limeAccent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.catelogyProduct.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                  border:
                      Border(right: BorderSide(width: 1, color: Colors.grey))),
              child: Text(
                _catelogyProduct[index]['name'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ));
        },
      ),
    ),
  );
}

Widget infoCardEat(dynamic item, BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.bottomLeft,
        child: Text(
          item['name'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blue[300],
                        onPressed: () {
                          viewModel.numberTicketDecrease(item);
                        },
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${item['number']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30)),
                        color: Colors.blue[300],
                        onPressed: () {
                          viewModel.numberTicketIncrease(item);
                        },
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(
              flex: 1,
              child: Text(
                '${viewModel.formatter.format(item['price'])}đ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
  if (viewModel.eat.isNotEmpty) {
    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.eat.length,
        itemBuilder: (context, index) {
          return infoCardEat(viewModel.eat[index], context);
        },
      ),
    );
  } else {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.black26,
                size: 45,
              ),
              Text('Giỏ hàng trống',
                  style: TextStyle(color: Colors.black26, fontSize: 20)),
            ]),
      ),
    );
  }
}
