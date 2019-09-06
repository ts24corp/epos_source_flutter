import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/config-domain.dart';
import 'package:flutter/material.dart';
import 'package:epos_source_flutter/src/app/helper/index.dart';

class ConfigDomainPageViewModel extends ViewModelBase {
  TextEditingController _domainController = new TextEditingController();
  get domainController => _domainController;

  TextEditingController _clientIDController = new TextEditingController();
  get clientIDController => _clientIDController;

  TextEditingController _clientSerectController = new TextEditingController();
  get clientSerectController => _clientSerectController;

  ConfigDomain cfd = new ConfigDomain();

  BuildContext context;
  ConfigDomainPageViewModel();
  void dispose() {
    super.dispose();
    _domainController.dispose();
    _clientIDController.dispose();
    _clientSerectController.dispose();
  }

  Future<void> onSaveConfigDomain() async {
    cfd.domain = _domainController.text;
    cfd.clientID = _clientIDController.text;
    cfd.clientSecret = _clientSerectController.text;
    this.showHideLoading(true);
    await cfd.saveLocal();
//    print(result);
    this.showHideLoading(false);
    ToastController.show(
        context: context,
        duration: Duration(seconds: 1),
        message: translation.text("CONFIG_DOMAIN.SAVE_SUCCESS"));
  }

  Future<void> reloadData() async {
    await cfd.reloadData();
    _domainController.text = cfd.domain;
    _clientIDController.text = cfd.clientID;
    _clientSerectController.text = cfd.clientSecret;
  }
}
