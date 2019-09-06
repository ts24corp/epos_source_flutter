import 'dart:core';

import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:epos_source_flutter/src/app/helper/loading_spinner.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:epos_source_flutter/src/app/pages/payTicket/payTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:epos_source_flutter/src/app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
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
  void initState() {
//    viewModel.loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
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
                              shape: CircleBorder(
                                  side: BorderSide(color: Colors.transparent)),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
//                            FlatButton(
//                              shape: CircleBorder(
//                                  side: BorderSide(color: Colors.transparent)),
//                              child: Icon(
//                                Icons.arrow_back,
//                                color: Colors.white,
//                                size: 25,
//                              ),
//                              onPressed: () {
////                                Navigator.pop(context);
//                              },
//                            ),
////                            itemTab(),
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return itemTab();
                                  },
                                ),
                              ),
                            ),
//                            Expanded(
//                              child: ListView.builder(
//                                  itemCount: viewModel.listHomeCat.length,
//                                  itemBuilder: (context, index) {
//                                    return itemTab();
//                                  }),
//                            ),
//                            Expanded(
//                              child: viewModel.listHomeCat.length == 0
//                                  ? LoadingSpinner.loadingView(
//                                      context: context, loading: true)
//                                  : DefaultTabController(
////                                      initialIndex: 0,
//                                      length: viewModel.listHomeCat.length,
//                                      child: TabBar(
////                                        controller: viewModel.tabIndex,
//                                        onTap: (index) {
//                                          // print('Tabbar: $index ');
//                                          viewModel.onHome();
//                                        },
//                                        indicatorColor: Colors.white,
//                                        isScrollable: true,
//                                        tabs: viewModel.listHomeCat
//                                            .map((PosCategory choice) {
//                                          return Tab(
//                                            icon: choice.name == 'home'
//                                                ? Icon(Icons.home)
//                                                : null,
//                                            text: choice.name != 'home'
//                                                ? choice.name.toUpperCase()
//                                                : null,
//
//                                            // icon: Icon(choice.icon),
//                                          );
//                                        }).toList(),
//                                      ),
//                                    ),
//                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SafeArea(child: SaleTicketBodyWidget()),
            );
          }),
    );
  }

  Widget itemTab() {
    return Container(
      child: FlatButton(
        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        child: Text('Name'),
        onPressed: () {},
      ),
    );
  }
}

class SaleTicketBodyWidget extends StatefulWidget {
  @override
  _SaleTicketBodyWidgetState createState() => _SaleTicketBodyWidgetState();
}

class _SaleTicketBodyWidgetState extends State<SaleTicketBodyWidget> {
  SaleTicketViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    Common.initFontSize(context);
    var isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;
//    SizeConfig.instance = SizeConfig()..init(context);
    viewModel = ViewModelProvider.of(context);
    SizeConfig.instance = SizeConfig(width: size.width, height: size.height)
      ..init(context);
    print('${size.width}=>>>>> SaleTicketPage <<<<=${size.height}');
    print('awawaw: ${viewModel.listAllCategoryByListParentID}');
    return StatefulWrapper(
      onInit: () {
        viewModel.loadData();
      },
      child: Column(
        children: <Widget>[
          viewModel.listChildCat.length == 0
              ? Container()
              : Container(
            height: 50,
            color: Colors.blue,
            child: DefaultTabController(
              length: viewModel.listChildCat.length,
              child: TabBar(
                onTap: (index) {
                  // print('Tabbar: $index ');
                  viewModel.onChooseID(index);
                },
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: viewModel.listChildCat.map((PosCategory choice) {
                  return Tab(
                    icon: choice.name == 'home' ? Icon(Icons.home) : null,
                    text: choice.name != 'home'
                        ? choice.name.toUpperCase()
                        : null,

                    // icon: Icon(choice.icon),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Row(
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
            ),
          ),
        ],
      ),
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
        hintText: translation.text("SALE_TICKET.SEARCH"),
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
  var size = MediaQuery
      .of(context)
      .size;
  /*24 is for notification bar on Android*/
  // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  final double itemWidth = size.width / 2;
  var isPortrait = MediaQuery
      .of(context)
      .orientation == Orientation.portrait;
  var listEat = viewModel.listChooseEat;
  print('print: ${viewModel.listProductIDCatID}');
  var listProduct = viewModel.listProductIDCatID;
  return Expanded(
    child: GridView.builder(
        itemCount: listProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (isPortrait == true ? 2 : 3),
          childAspectRatio: (itemWidth / itemWidth),
        ),
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(3.0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              viewModel.addEat(listProduct[index]);
            },
            child: Container(
              color: Colors.amberAccent,
              margin: EdgeInsets.all(3),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black26.withOpacity(0.2),
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    width: size.width,
                    child: Text(
                      '${viewModel.formatter.format(
                          listProduct[index].listPrice)}đ',
                      style: TextStyle(
                          fontSize: SizeConfig.setSize(14),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          listProduct[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              inherit: true,
                              fontSize: SizeConfig.setSize(16),
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
  );
}

Widget _viewCommit(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  var size = MediaQuery
      .of(context)
      .size;
  var isPortrait = MediaQuery
      .of(context)
      .orientation == Orientation.portrait;
  return Container(
    child: Column(
      children: <Widget>[
        // Divider(),
        Container(
          height: isPortrait == true ? size.width / 10 : size.width / 20,
          padding: EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            '${viewModel.formatter.format(viewModel.total)}đ',
            style: TextStyle(
                fontSize: SizeConfig.setSize(20), fontWeight: FontWeight.w600),
          ),
        ),
        Button(
          onPressed: () {
            Navigator.pushNamed(context, PayTicketPage.routeName);
          },
          paddingContainer: EdgeInsets.symmetric(horizontal: 4),
          title: translation.text("SALE_TICKET.PAY"),
          colorButton: Colors.red,
        )
      ],
    ),
  );
}

Widget scrollList(BuildContext context) {
  SaleTicketViewModel viewModel = ViewModelProvider.of(context);
  // var size = MediaQuery.of(context).size;
  /*24 is for notification bar on Android*/
  // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  var isPortrait = MediaQuery
      .of(context)
      .orientation == Orientation.portrait;
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
                style: TextStyle(
                    fontSize: SizeConfig.setSize(16),
                    fontWeight: FontWeight.w600),
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
          item.name,
          style: TextStyle(
              fontSize: SizeConfig.setSize(18), fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                flex: 55,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: Colors.blue[300],
                        onPressed: () {
                          viewModel.numberTicketDecrease(item);
                        },
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.setSize(20),
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '1',
//                        '${item['number']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.setSize(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: RaisedButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.blue[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25)),
                          onPressed: () {
                            viewModel.numberTicketIncrease(item);
                          },
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.setSize(20),
                                color: Colors.white),
                            // textAlign: TextAlign.center,
                          )),
                    )
                  ],
                )),
            Flexible(
              flex: 45,
              child: Text(
                '${viewModel.formatter.format(item.listPrice)}đ',
                style: TextStyle(
                    fontSize: SizeConfig.setSize(16),
                    fontWeight: FontWeight.bold),
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
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.black26,
                size: 45,
              ),
              Text(translation.text("SALE_TICKET.CART_EMPTY"),
                  style: TextStyle(
                      color: Colors.black26, fontSize: SizeConfig.setSize(22))),
            ]),
      ),
    );
  }
}
