import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_assignment_3/app/common/data.dart';
import 'package:flutter_assignment_3/app/models/portfolio.model.dart';

class PortfolioProvider with ChangeNotifier {
  List<PortfolioDataModel>? _portfolio;

  List<PortfolioDataModel>? get portfolio {
    if (_portfolio == null) {
      final response = portfolioData();
      _portfolio = portfolioDataModelFromJson(json.encode(response["data"]));
      return _portfolio!;
    }
    return _portfolio;
  }

  addPortfolio(PortfolioDataModel model) {
    _portfolio?.add(model);
    notifyListeners();
  }
}
