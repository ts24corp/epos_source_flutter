import 'package:flutter/material.dart';

class CheckTicketHistoryPage extends StatelessWidget {
  static const String routeName = "/checkTicketHistory";
  const CheckTicketHistoryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CheckTicketHistory"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
    );
  }
}
