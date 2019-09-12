import 'dart:core';

import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:epos_source_flutter/src/app/pages/payTicket/payTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:validators/validators.dart';

class SaleTicketPage extends StatefulWidget {
  static const String routeName = "/saleTicket";

  @override
  _SaleTicketPageState createState() => _SaleTicketPageState();
}

class _SaleTicketPageState extends State<SaleTicketPage> {
  SaleTicketViewModel viewModel = SaleTicketViewModel();

  @override
  void initState() {
    viewModel.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Common.initFontSize(context);
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
              // appBar: _appBar(viewModel),
              appBar: _appBar(context),
              body: SafeArea(child: SaleTicketBodyWidget()),
            );
          }),
    );
  }

  Widget _appBar(BuildContext context) {
    return PreferredSize(
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
                  Expanded(
                    child: Container(
                      height: kToolbarHeight,
                      child: Scrollbar(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.listHomeCat.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: FlatButton(
                                child: viewModel.listHomeCat[index].name ==
                                        'home'
                                    ? Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        viewModel.listHomeCat[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Common.setFontSize(16)),
                                      ),
                                onPressed: () {
                                  viewModel.onHomeCat(
                                      viewModel.listHomeCat[index], index);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Widget itemTab(PosCategory item) {
//     return Container(
//       child: FlatButton(
// //        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
//         child: item.name == 'home'
//             ? Icon(
//                 Icons.home,
//                 color: Colors.white,
//               )
//             : Text(
//                 item.name,
//                 style: TextStyle(
//                     color: Colors.white, fontSize: Common.setFontSize(16)),
//               ),
//         onPressed: () {
// //          viewModel.onHomeCat(item);
//         },
//       ),
//     );
//   }
}

class SaleTicketBodyWidget extends StatefulWidget {
  @override
  _SaleTicketBodyWidgetState createState() => _SaleTicketBodyWidgetState();
}

class _SaleTicketBodyWidgetState extends State<SaleTicketBodyWidget>
    with TickerProviderStateMixin {
  SaleTicketViewModel viewModel;
  TabController tc;
  TabController _tabController() => TabController(
        vsync: this,
        length: viewModel.listChildCat.length,
        initialIndex: viewModel.listChildCat.length - 1,
      );
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    viewModel = ViewModelProvider.of(context);
    // tc = _tabController();
    return Column(
      children: <Widget>[
        viewModel.listChildCat.length == 0
            ? Container()
            : _listCategoryChild(viewModel),
        // Container(
        //   height: 50,
        //   color: Colors.blue,
        //   // child: DefaultTabController(
        //   //   length: viewModel.listChildCat.length,
        //   child: TabBar(
        //     controller: tc,
        //     onTap: (index) {
        //       // print('Tabbar: $index ');
        //       // viewModel.onChooseID(index);
        //     },
        //     indicatorColor: Colors.white,
        //     isScrollable: true,
        //     tabs: viewModel.listChildCat.map((choice) {
        //       return Tab(
        //         icon: choice.name == 'home' ? Icon(Icons.home) : null,
        //         text: choice.name != 'home' ? choice.name.toUpperCase() : null,

        //         // icon: Icon(choice.icon),
        //       );
        //     }).toList(),
        //   ),
        //   //  ),
        // ),
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

Widget _listCategoryChild(
  SaleTicketViewModel viewModel,
) {
  return Container(
    color: Colors.blue,
    height: kMinInteractiveDimension,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: viewModel.listChildCat.length,
      itemBuilder: (context, index) {
        return Container(
          child: FlatButton(
//        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            child: Text(
              viewModel.listChildCat[index].name,
              style: TextStyle(
                  color: Colors.white, fontSize: Common.setFontSize(16)),
            ),
            onPressed: () {
              viewModel.onChildCat(viewModel.listChildCat[index], index);
            },
          ),
        );
      },
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
//  var listEat = viewModel.listChooseEat;
//  print('print: ${viewModel.listProductIDCatID}');
  var listProduct = viewModel.listProduct;
//  Uint8List imageData = base64.decode(viewModel.imageURL);
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
              margin: EdgeInsets.all(3),
//              color: Colors.yellow,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image01.png"),
                ),

//                  AssetImage("image01.png"),
//                  MemoryImage(imageData),
//                Image.memory(imageData),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black26.withOpacity(0.2),
                    padding: EdgeInsets.only(top: 4, bottom: 4),
//                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                    width: size.width,
                    child: Text(
                      '${viewModel.formatter.format(listProduct[index].listPrice)}đ',
                      style: TextStyle(
                          fontSize: Common.setFontSize(14),
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
                              fontSize: Common.setFontSize(16),
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
  var size = MediaQuery.of(context).size;
  var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
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
                fontSize: Common.setFontSize(20), fontWeight: FontWeight.w600),
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
              fontSize: Common.setFontSize(18), fontWeight: FontWeight.bold),
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
                              fontSize: Common.setFontSize(20),
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        item.uomId[0].toString(),
//                        '${item['number']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Common.setFontSize(20),
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
                                fontSize: Common.setFontSize(20),
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
                    fontSize: Common.setFontSize(16),
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
          print('EATLIST: ${viewModel.eat[index].id}');
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
                      color: Colors.black26, fontSize: Common.setFontSize(20))),
            ]),
      ),
    );
  }
}
