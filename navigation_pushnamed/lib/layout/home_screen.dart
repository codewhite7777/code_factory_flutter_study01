import 'package:flutter/material.dart';
import 'package:navigation_pushnamed/layout/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home Screen',
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/route/one',
              arguments: 42,
            );
          },
          child: const Text('Push named with data (argument)'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/route/one',
              arguments: true,
            );
          },
          child: const Text('Push named with data (argument)'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/route/three',
              arguments: 3.14,
            );
          },
          child: const Text('Push named with data (argument)'),
        ),
      ],
    );
  }
}
