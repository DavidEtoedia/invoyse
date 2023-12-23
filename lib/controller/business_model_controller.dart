import 'package:flutter/material.dart';
import 'package:invoyse_task/model/business_model.dart';

class BusinessController extends ChangeNotifier {
  List<BusinessModel> _businessModel = [];

  List<BusinessModel> get businessess => _businessModel;

  BusinessModel models = BusinessModel();

  addBusinessInfo(BusinessModel model) {
    models.copyWith(
        businessAddress: model.businessName,
        businessEmail: model.businessEmail,
        businessPhone: model.businessPhone);

    print(model);
  }

  void addBusiness(BusinessModel model) {
    var req = models.copyWith();

    _businessModel.add(req);
    notifyListeners();
  }
}
