import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:flutter/material.dart';

class ConfigDomainPageViewModel extends ViewModelBase {
  TextEditingController _domainController = new TextEditingController();
  get domainController => _domainController;
  TextEditingController _clientIDController = new TextEditingController();
  get clientIDController => _clientIDController;
  TextEditingController _clientSerectController = new TextEditingController();
  get clientSerectController => _clientSerectController;

  ConfigDomainPageViewModel() {
    _domainController.addListener(() {
      print(_domainController.text);
    });
    _clientIDController.addListener(() {
      print(_clientIDController.text);
    });
    _clientSerectController.addListener(() {
      print(_clientSerectController.text);
    });
  }

  void dispose() {
    super.dispose();
    _domainController.dispose();
    _clientIDController.dispose();
    _clientSerectController.dispose();
  }

  Future<void> onSaveConfigDomain() async {}
}
