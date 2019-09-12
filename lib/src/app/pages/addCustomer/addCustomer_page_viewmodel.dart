import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/index.dart';
import 'package:epos_source_flutter/src/app/model/res-partner.dart';
import 'package:flutter/material.dart';

class AddCustomerViewModel extends ViewModelBase {
  TextEditingController _nameController = new TextEditingController();

  get nameController => _nameController;

  TextEditingController _emailController = new TextEditingController();

  get emailController => _emailController;
  TextEditingController _phoneController = new TextEditingController();

  get phoneController => _phoneController;

  TextEditingController _addressController = new TextEditingController();

  get addressController => _addressController;

  ResPartner partner = ResPartner();

//  BuildContext context;
  String _errorName;

  get errorName => _errorName;
  String _errorPhone;

  get errorPhone => _errorPhone;
  String _errorEmail;

  get errorEmail => _errorEmail;

  AddCustomerViewModel() {
    _nameController.addListener(() {
      if (_nameController.text.length > 0) isValidName();
    });
    _emailController.addListener(() {
      if (_emailController.text.length > 1) isValidEmail();
    });
    _phoneController.addListener(() {
      if (_phoneController.text.length > 1) isValidPhone();
    });
  }

  validateName(String name) {
    if (name == null || name.trim() == "" || name.length < 2)
      return "Name require min 2 characters";

    return null;
  }

  bool isValidName() {
    _errorName = null;
    var resultName = validateName(_nameController.text);
    if (resultName != null) {
      _errorName = resultName;
      sink.add(false);
      return false;
    } else
      sink.add(true);
    return true;
  }

  bool isValidEmail() {
    _errorEmail = null;
    var resultEmail = Validator.validateEmail(_emailController.text);
    if (resultEmail != null) {
      _errorEmail = resultEmail;
      sink.add(true);
      return false;
    } else
      sink.add(true);
    return true;
  }

  bool isValidPhone() {
    _errorPhone = null;
    var resultPhone = Validator.validatePhone(_phoneController.text);
    if (resultPhone != null) {
      _errorPhone = resultPhone;
      sink.add(false);
      return false;
    } else
      sink.add(true);
    return true;
  }

  bool isValidInfo() {
    if (isValidName() && isValidEmail() && isValidPhone()) {
      sink.add(true);
      return true;
    }
    return false;
  }

  Future onAddCustomer(BuildContext context) async {
    partner.name = _nameController.text;
    partner.email = _emailController.text;
    partner.phone = _phoneController.text;
    partner.contactAddress = _addressController.text;
    print(
        '${partner.name} --- ${partner.email} --- ${partner.phone} --- ${partner.contactAddress} ');
    if (isValidInfo()) {
      this.showHideLoading(true);
      Map<bool, int> res = await api.createCustomer(partner);
      this.showHideLoading(false);
      print(res);
      if (res.containsKey(true)) {
        ToastController.show(
            context: context,
            duration: Duration(seconds: 1),
            message: translation.text("CONFIG_DOMAIN.SAVE_SUCCESS"));
      }
    } else
      ToastController.show(
          context: context,
          duration: Duration(seconds: 1),
          message: translation.text("Mời nhập thông tin đầy đủ"));
  }

  Future<void> reloadData(ResPartner customer) async {
    if (customer != null) {
      _nameController.text = customer.name == false ? '' : customer.name;
      print('name: ${customer.name}');
      _emailController.text = customer.email == false ? '' : customer.email;
      print('email: ${customer.email}');
      _phoneController.text = customer.phone == false ? '' : customer.phone;
      print('Phone: ${customer.phone}');
      _addressController.text =
          customer.contactAddress == false ? '' : customer.contactAddress;
      print('Address: ${customer.contactAddress}');
    }
  }

  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
  }
}
