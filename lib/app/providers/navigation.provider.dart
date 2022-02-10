import 'package:flutter/foundation.dart';
import 'package:flutter_assignment_3/app/screens/dashboard/tabs/charts.tab.dart';
import 'package:flutter_assignment_3/app/screens/dashboard/tabs/coin_list.tab.dart';
import 'package:flutter_assignment_3/app/screens/dashboard/tabs/home.tab.dart';
import 'package:flutter_assignment_3/app/screens/dashboard/tabs/settings.tab.dart';

class NavigationProvider with ChangeNotifier {
  final tabs = [
    const HomeTab(),
    const CoinListTab(),
    const ChartsTab(),
    const SettingsTab()
  ];

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }
}
