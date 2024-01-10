import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/UTILS/Routes/routes_name.dart';
import 'package:mvvm/VIEW/add_screen.dart';
import 'package:mvvm/VIEW/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.addscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => Add_Screen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyHomePage(title:'Crud operation'));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Null route'),
            ),
          );
        });
    }
  }
}
