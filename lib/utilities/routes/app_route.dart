import 'package:boilerplate_structure/screens/home_screen.dart';
import 'package:boilerplate_structure/utilities/routes/route_name.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == RouteNames.splash) {
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return const HomeScreen();
        },
      );
    } else {
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          );
        },
      );
    }
  }
}