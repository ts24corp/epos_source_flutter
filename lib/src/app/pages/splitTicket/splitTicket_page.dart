import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:epos_source_flutter/src/app/pages/splitTicket/splitTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:epos_source_flutter/src/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SplitTicketPage extends StatefulWidget {
  static const String routeName = '/splitTicket';

  @override
  _SplitTicketPageState createState() {
    return _SplitTicketPageState();
  }
}

class _SplitTicketPageState extends State<SplitTicketPage> {
  SplitTicketViewModel viewModel = SplitTicketViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: _appBar(viewModel),
              body: SplitTicketBodyWidget(),
            );
          }),
    );
  }

  Widget _appBar(SplitTicketViewModel viewModel) => GradientAppBar(
        title: Text("Tách hoá đơn"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
      );
}

class SplitTicketBodyWidget extends StatefulWidget {
  @override
  _SplitTicketBodyWidgetState createState() {
    return _SplitTicketBodyWidgetState();
  }
}

class _SplitTicketBodyWidgetState extends State<SplitTicketBodyWidget> {
  SplitTicketViewModel viewModel;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    Common.initFontSize(context);
    var size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    // TODO: implement build
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
//                      color: Colors.red,
                      child: ListView.builder(
                          itemCount: viewModel.listEat.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  viewModel.onSplitRight(
                                      viewModel.listEat[index], index);
                                },
                                child: _itemEat(
                                    context, viewModel.listEat[index], index));
                          })),
                ),
                Container(
                  height: size.height,
                  width: size.width / 300,
                  color: Colors.black26,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
//                      color: Colors.red,
                      child: ListView.builder(
                          itemCount: viewModel.listSplit.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  viewModel.onSplitLeft(
                                      viewModel.listSplit[index], index);
                                },
                                child: _itemEat(context,
                                    viewModel.listSplit[index], index));
                          })),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height:
                      isPortrait == true ? size.width / 10 : size.width / 20,
                  padding: EdgeInsets.only(right: 8),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
//                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Text(
                    '${viewModel.formatter.format(viewModel.total)}đ',
                    style: TextStyle(
                        fontSize: SizeConfig.setSize(20),
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Button(
                  onPressed: () {},
                  title: 'Tách',
                  paddingContainer: EdgeInsets.all(8),
                  textStyle: TextStyle(
                      fontSize: SizeConfig.setSize(22), color: Colors.white),
                  colorButton: Colors.red,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemEat(BuildContext context, dynamic item, int index) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item['name'],
              style: TextStyle(
                  fontSize: Common.setFontSize(16),
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('x${item['amount']}'),
              Text('${viewModel.formatter.format(item['price'])}đ',
                  style: TextStyle(fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    );
  }
}
