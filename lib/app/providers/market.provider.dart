import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_assignment_3/app/common/data.dart';
import 'package:flutter_assignment_3/app/models/market.model.dart';

class MarketProvider with ChangeNotifier {
  List<CoinModel>? _coinModels;

  List<CoinModel>? get coinModels {
    if (_coinModels == null) {
      final response = jsonData();
      _coinModels = marketModelFromJson(json.encode(response["data"]));
      return _coinModels!;
    }
    return _coinModels;
  }
}
