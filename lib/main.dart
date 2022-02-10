import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_3/app/providers/market.provider.dart';
import 'package:flutter_assignment_3/app/providers/navigation.provider.dart';
import 'package:flutter_assignment_3/app/providers/portfolio.provider.dart';
import 'package:flutter_assignment_3/app/screens/dashboard/dashboard.screen.dart';
import 'package:flutter_assignment_3/app/screens/portfolio.screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NavigationProvider>(
        create: (context) => NavigationProvider(),
      ),
      ChangeNotifierProvider<PortfolioProvider>(
        create: (context) => PortfolioProvider(),
      ),
      ChangeNotifierProvider<MarketProvider>(
        create: (context) => MarketProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.green,
          iconTheme: const IconThemeData(
            color: Colors.green,
          )),
      initialRoute: Dashboard.name,
      routes: {
        Dashboard.name: (context) => const Dashboard(),
        PortfolioScreen.name: (context) => const PortfolioScreen()
      },
    );
  }
}
