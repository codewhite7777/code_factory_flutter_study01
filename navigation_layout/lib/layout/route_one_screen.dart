import 'package:flutter/material.dart';
import 'package:navigation_layout/layout/main_layout.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One Screen',
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Pop'),
        ),
      ],
    );
  }
}
