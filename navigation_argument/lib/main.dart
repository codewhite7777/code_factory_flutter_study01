import 'package:flutter/material.dart';
import 'package:navigation_argument/layout/main_layout.dart';
import 'package:navigation_argument/layout/route_two_screen.dart';
import 'layout/route_one_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainLayout(
        title: 'Home Screen',
        children: [
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RouteOneScreen(
                        data: 42,
                      ),
                    ),
                  );
                },
                child: const Text('Push with date (construct)'),
              );
            },
          ),
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RouteTwoScreen(),
                    settings: const RouteSettings(
                      arguments: 42,
                    ),
                  ),
                );
              },
              child: const Text('Push with date (argument)'),
            );
          }),
        ],
      ),
    );
  }
}
