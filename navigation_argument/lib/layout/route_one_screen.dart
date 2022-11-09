import 'package:flutter/material.dart';
import 'package:navigation_argument/layout/main_layout.dart';

class RouteOneScreen extends StatelessWidget {
  final int data;

  const RouteOneScreen({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One Screen',
      children: [
        Text(
          'data from constructor : $data',
          textAlign: TextAlign.center,
        ),
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Pop'),
            );
          },
        ),
      ],
    );
  }
}
