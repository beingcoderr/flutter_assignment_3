import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/app/providers/navigation.provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  static const name = "/dashboard";
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: provider.index,
              unselectedItemColor: Colors.grey[400],
              onTap: (value) {
                provider.index = value;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.home), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.clipboardList), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.chartPie), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    label: ""),
              ]),
          body: provider.tabs[provider.index],
        );
      },
    );
  }
}
