import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/common.dart';
import 'package:epos_source_flutter/src/app/pages/payTicket/payTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class PayTicketPage extends StatefulWidget {
  static const String routeName = "/payTicket";
  @override
  _PayTicketPageState createState() => _PayTicketPageState();
}

class _PayTicketPageState extends State<PayTicketPage> {
  PayTicketViewModel viewModel = PayTicketViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(viewModel),
      body: ViewModelProvider(
        viewmodel: viewModel,
        child: PayTicketBodyWidget(),
      ),
    );
  }

  Widget _appBar(PayTicketViewModel viewModel) => GradientAppBar(
        title: Text("Trang thanh toán"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
        // bottom: TabBar(
        //   tabs: <Widget>[Text('Một'), Text('Hai')],
        // ),
      );
}

class PayTicketBodyWidget extends StatefulWidget {
  @override
  _PayTicketBodyWidgetState createState() => _PayTicketBodyWidgetState();
}

class _PayTicketBodyWidgetState extends State<PayTicketBodyWidget> {
  TextEditingController _controller;
  var _controller2 = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '500,000');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _controller,
                  enabled: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autocorrect: true,
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    NumericTextFormatter()
                  ],
                  decoration: InputDecoration(
                      labelText: 'Tổng tiền',
                      prefixIcon: Icon(Icons.print),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _controller,
                  enabled: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autocorrect: true,
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  decoration: InputDecoration(
                      labelText: 'Tiền trả khách',
                      prefixIcon: Icon(Icons.print),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Thanh toán tiền mặt:',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: _listPayPrice(context),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: TextFormField(
                          controller: _controller2,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          autocorrect: true,
                          textCapitalization: TextCapitalization.characters,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            NumericTextFormatter()
                          ],
                          decoration: InputDecoration(
                              labelText: 'Số tiền khách trả',
                              prefixIcon: Icon(Icons.print),
                              border: OutlineInputBorder(),
                              fillColor: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text('VND',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    child: Text('BANK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            )
          ],
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.grey,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: size.width,
              height: isPortrait == true ? size.width / 10 : size.width / 20,
              child: RaisedButton(
                child: Text(
                  "Thanh toán",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Colors.red,
                onPressed: () {
                  // Navigator.pushNamed(context, PayTicketPage.routeName);
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _listPayPrice(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listPayPrices.length,
          itemBuilder: (context, index) {
            return Container(
                // margin: EdgeInsets.all(),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    _controller2.text = '${listPayPrices[index].title}';
                  },
                  child: Text(
                    '${listPayPrices[index].title}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ));
          }),
    );
  }
}
