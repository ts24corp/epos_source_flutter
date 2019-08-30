import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:flutter/material.dart';

class PayTicketViewModel extends ViewModelBase {
  TextEditingController _textInputCash = TextEditingController();
  TextEditingController _textInputTotal = TextEditingController();
  TextEditingController _textInputReturn = TextEditingController();
  TextEditingController _textInputBank = TextEditingController();

  get textInputCash => _textInputCash;

  get textInputTotal => _textInputTotal;

  get textInputReturn => _textInputReturn;

  get textInputBank => _textInputBank;

  PayTicketViewModel() {
    _textInputTotal = TextEditingController(text: '200000');
    _textInputCash.addListener(() {
      if (_textInputCash.text.isNotEmpty) {
        _textInputReturn.text =
            '${int.parse(_textInputCash.text) - int.parse(_textInputTotal.text)}';
        sink.add(true);
      }
    });
  }

  void dispose() {
    super.dispose();
    _textInputCash.dispose();
    _textInputTotal.dispose();
    _textInputReturn.dispose();
    _textInputBank.dispose();
  }
}

class ListPayPrice {
  const ListPayPrice({this.title, this.id});

  final String title;
  final int id;
}

const List<ListPayPrice> listPayPrices = const <ListPayPrice>[
  const ListPayPrice(title: '500000', id: 1),
  const ListPayPrice(title: '200000', id: 2),
  const ListPayPrice(title: '100000', id: 3),
  const ListPayPrice(title: '50000', id: 4),
  const ListPayPrice(title: '20000', id: 5),
  const ListPayPrice(title: '10000', id: 6),
];
