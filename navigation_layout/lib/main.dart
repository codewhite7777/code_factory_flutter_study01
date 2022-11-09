import 'package:flutter/material.dart';
import 'package:navigation_layout/layout/main_layout.dart';
import 'package:navigation_layout/layout/route_one_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainLayout(
        title: 'Home Screen',
        children: [
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RouteOneScreen(),
                  ),
                );
              },
              child: const Text('Push'),
            );
          }),
        ],
      ),
    );
  }
}
