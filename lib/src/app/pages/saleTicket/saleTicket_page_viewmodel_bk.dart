import 'package:easy_dialogs/single_choice_confirmation_dialog.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:flutter/material.dart';

class SaleTicketViewModel extends ViewModelBase {
  @override
  void dispose() {
    super.dispose();
  }

  BuildContext context;
  final List<String> areaGate = [
    'Cổng chính',
    'Cổng A',
    'Cổng B',
  ];

  String selectAreaGate = "";

  SaleTicketViewModel() {
    selectAreaGate = areaGate[0];
  }
  Future<void> areaSaleOnTap() async {
    return showDialog<void>(
        builder: (BuildContext context) =>
            SingleChoiceConfirmationDialog<String>(
              title: Text('Phone ringtone'),
              initialValue: selectAreaGate,
              items: areaGate,
              onSelected: (value) {
                selectAreaGate = value;
                print(value);
              },
            ),
        context: context);
  }
}
