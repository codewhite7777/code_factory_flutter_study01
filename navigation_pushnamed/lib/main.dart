import 'package:flutter/material.dart';
import 'package:navigation_pushnamed/layout/home_screen.dart';
import 'package:navigation_pushnamed/layout/route_one_screen.dart';
import 'package:navigation_pushnamed/layout/route_three_screen.dart';
import 'package:navigation_pushnamed/layout/route_two_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/route/one': (context) => const RouteOneScreen(),
        '/route/two': (context) => const RouteTwoScreen(),
        '/route/three': (context) => const RouteThreeScreen(),
      },
    );
  }
}
