
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:intl/intl.dart';

class SplitTicketViewModel extends ViewModelBase {
  final formatter = new NumberFormat("#,###");
  List<dynamic> listSplit = [];
  var total = 0;

  Future<void> onSplitRight(dynamic item, int index) async {
    listSplit.add(item);
    listEat.removeWhere((i) => i['id'] == listEat[index]['id']);
    total = total + item['price'];
    sink.add(true);
  }

  Future<void> onSplitLeft(dynamic item, int index) async {
    listEat.add(item);
    listSplit.removeWhere((i) => i['id'] == listSplit[index]['id']);
    total = total - item['price'];
    sink.add(true);
  }

  List<dynamic> listEat = [
    {'id': 1, 'name': 'Lẫu thập cẩm', 'price': 40000, 'amount': 3},
    {'id': 2, 'name': 'Lẫu thập cẩm', 'price': 40000, 'amount': 3},
    {'id': 3, 'name': 'Lẫu thập cẩm', 'price': 40000, 'amount': 3},
    {'id': 4, 'name': 'Lẫu thập cẩm', 'price': 40000, 'amount': 3},
    {'id': 5, 'name': 'Lẫu thập cẩm', 'price': 40000, 'amount': 3},
    {'id': 6, 'name': 'Lẫu thập cẩm', 'price': 40000, 'amount': 3}
  ];
}
