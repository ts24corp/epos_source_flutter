import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/customerTicket/customerTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/invoiceTicket/invoiceTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/payTicket/payTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/splitTicket/splitTicket_page.dart';
import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:epos_source_flutter/src/app/widgets/button.dart';
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
        title: Text(translation.text("PAY_TICKET.PAY")),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
      );
}

class PayTicketBodyWidget extends StatefulWidget {
  @override
  _PayTicketBodyWidgetState createState() => _PayTicketBodyWidgetState();
}

class _PayTicketBodyWidgetState extends State<PayTicketBodyWidget> {
  PayTicketViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    var size = MediaQuery.of(context).size;
//    Common.initFontSize(context);
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    SizeConfig.instance = SizeConfig(width: size.width, height: size.height)
      ..init(context);
    print('=>>>>> PayTicketPage <<<<=');
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
//              flex: 9,
              child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 10),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: _cardTextField(
                          context,
                          translation.text("PAY_TICKET.TOTAL"),
                          viewModel.textInputTotal,
                          EdgeInsets.all(8),
                          Icon(Icons.print),
                          false)),
                  Flexible(
                      flex: 1,
                      child: _cardTextField(
                          context,
                          translation.text("PAY_TICKET.BALANCE"),
                          viewModel.textInputReturn,
                          EdgeInsets.only(right: 8),
                          Icon(Icons.print),
                          false)),
                ],
              ),
              _cardCash(context),
              _cardBank(context)
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: isPortrait == true ? size.height / 15 : size.width / 15,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                // alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: Button(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, CustomerTicketPage.routeName);
                      },
                      title: translation.text("PAY_TICKET.GUEST"),
                      colorButton: Colors.orange,
                      textStyle: TextStyle(
                          fontSize: SizeConfig.setSize(16),
                          color: Colors.white),
                      paddingContainer: EdgeInsets.symmetric(horizontal: 4),
                    )),
                    Flexible(
                        child: Button(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SplitTicketPage.routeName);
                      },
                      title: translation.text("PAY_TICKET.SPLIT"),
                      textStyle: TextStyle(
                          fontSize: SizeConfig.setSize(16),
                          color: Colors.white),
                      colorButton: Colors.red,
                      paddingContainer: EdgeInsets.symmetric(horizontal: 4),
                    )),
                    Flexible(
                      child: Button(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, InvoiceTicketPage.routeName);
                        },
                        title: translation.text("PAY_TICKET.PAY"),
                        textStyle: TextStyle(
                            fontSize: SizeConfig.setSize(16),
                            color: Colors.white),
                        paddingContainer: EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _cardTextField(
      BuildContext context,
      String title,
      TextEditingController controller,
      EdgeInsets padding,
      Icon icon,
      bool status) {
//    PayTicketViewModel viewModel =  PayTicketViewModel();
    return Container(
      padding: padding,
      child: TextFormField(
        controller: controller,
        enabled: status,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        autocorrect: true,
        // autofocus: true,
        textCapitalization: TextCapitalization.characters,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontWeight: FontWeight.bold,
//            fontSize: Common.setFontSize(16)
          fontSize: SizeConfig.size_14,
        ),
//        inputFormatters: [
//          WhitelistingTextInputFormatter.digitsOnly,
//          NumericTextFormatter()
//        ],
        decoration: InputDecoration(
            labelText: title,
            prefixIcon: icon,
            border: OutlineInputBorder(),
            fillColor: Colors.blue),
      ),
    );
  }

  Widget _cardCash(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      translation.text("PAY_TICKET.CASH_PAYMENT"),
                      style: TextStyle(
                          color: Colors.blue,
//                          fontSize: Common.setFontSize(16),
                          fontSize: SizeConfig.size_18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(vertical: 10),
                    child: _listPayPrice(context),
                  ),
                  _cardTextField(
                      context,
                      translation.text("PAY_TICKET.GUEST_PAID"),
                      viewModel.textInputCash,
                      EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      Icon(Icons.print),
                      true)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _cardBank(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      translation.text("PAY_TICKET.BANK_PAYMENT"),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: SizeConfig.size_18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  _cardTextField(
                      context,
                      translation.text("PAY_TICKET.CARD_NUMBER"),
                      viewModel.textInputBank,
                      EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      Icon(Icons.credit_card),
                      true)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listPayPrice(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listPayPrices.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: InkWell(
                onTap: () {
                  viewModel.textInputCash.text =
                      '${listPayPrices[index].title}';
                },
                child: Chip(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue[600],
                    child: Text(
                      '\$',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  label: Text('${listPayPrices[index].title}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),

//                RaisedButton(
//                  color: Colors.white,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0)),
//                  onPressed: () {
//                    viewModel.textInputCash.text = '${listPayPrices[index].title}';
//                  },
//                  child: Text(
//                    '${listPayPrices[index].title}',
//                    style: TextStyle(
//                        fontSize: Common.setFontSize(16),
//                        fontWeight: FontWeight.bold),
//                  ),
//                )
            );
          }),
    );
  }
}
