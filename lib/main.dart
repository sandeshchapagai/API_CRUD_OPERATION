import 'package:flutter/material.dart';
import 'package:mvvm/UTILS/Routes/routes.dart';
import 'package:mvvm/UTILS/Routes/routes_name.dart';
import 'package:mvvm/VIEW_MODEL/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

// class Counter with ChangeNotifier {
//   int _count = 0;
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
//
//   void decrement() {
//     _count--;
//     notifyListeners();
//   }
//
//   // Method to save count using shared preferences
//   Future<void> saveCount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('count', _count);
//   }
//
//   // Method to load count from shared preferences
//   Future<void> loadCount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _count = prefs.getInt('count') ?? 0;
//     notifyListeners();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Load count when the app starts
    // context.read<Counter>().loadCount();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewMOde())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
