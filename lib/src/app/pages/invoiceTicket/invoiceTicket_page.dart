import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoiceTicketPage extends StatefulWidget {
  static const String routeName = '/invoiceTicket';

  @override
  _InvoiceTicketPageState createState() {
    return _InvoiceTicketPageState();
  }
}

class _InvoiceTicketPageState extends State<InvoiceTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Ticket'),
      ),
      body: IncoiceTicketBodyWidget(),
    );
  }
}

class IncoiceTicketBodyWidget extends StatefulWidget {
  IncoiceTicketBodyWidget({Key key}) : super(key: key);

  @override
  _IncoiceTicketBodyWidgetState createState() {
    return _IncoiceTicketBodyWidgetState();
  }
}

class _IncoiceTicketBodyWidgetState extends State<IncoiceTicketBodyWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
//              leading: Icon(Icons.album),
              title: Text(
                'Invoice',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
//              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Divider(
              endIndent: 12,
              indent: 12,
              color: Colors.black,
            ),
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
            Divider(
              endIndent: 12,
              indent: 12,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Total:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.setSize(16))),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('30.000',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.setSize(16))))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('VAT:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.setSize(16))),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('30.000',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.setSize(16))))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Balance:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.setSize(16))),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('30.000',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.setSize(16))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Thit bo ngon',
                  style: TextStyle(
                      fontSize: SizeConfig.setSize(16),
                      fontWeight: FontWeight.w600)),
              Text('x2'),
            ],
          ),
          Container(
            child: Text('20.000',
                style: TextStyle(
                    fontSize: SizeConfig.setSize(16),
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
