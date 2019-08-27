import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';

class PayTicketViewModel extends ViewModelBase {}

class ListPayPrice {
  const ListPayPrice({this.title, this.id});
  final String title;
  final int id;
}

const List<ListPayPrice> listPayPrices = const <ListPayPrice>[
  const ListPayPrice(title: '500,000', id: 1),
  const ListPayPrice(title: '200,000', id: 2),
  const ListPayPrice(title: '100,000', id: 3),
  const ListPayPrice(title: '50,000', id: 4),
  const ListPayPrice(title: '20,000', id: 5),
  const ListPayPrice(title: '10,000', id: 6),
];
