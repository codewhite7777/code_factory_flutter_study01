import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'u and i',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 30.0,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 20.0,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
