import 'package:flutter/material.dart';
import 'package:invoyse_task/model/business_model.dart';

class BusinessController extends ChangeNotifier {
  final List<BusinessModel> _businessModel = [];
  String _selectedBusiness = "";

  List<BusinessModel> get businessess => _businessModel;

  String get selectedBusiness => _selectedBusiness;

  BusinessModel models = BusinessModel();

  addBusinessInfo(BusinessModel model) {
    models = models.copyWith(
        businessName: model.businessName,
        businessAddress: model.businessAddress,
        businessEmail: model.businessEmail,
        businessPhone: model.businessPhone);
  }

  void addBusiness(BusinessModel model) {
    models = models.copyWith(
        amount: model.amount,
        logo: model.logo,
        businessCategory: model.businessCategory);

    _businessModel.insert(0, models);
    _selectedBusiness = models.businessName!;
    notifyListeners();
  }

  void selecteBusiness(String name) {
    _selectedBusiness = name;

    notifyListeners();
  }
}
