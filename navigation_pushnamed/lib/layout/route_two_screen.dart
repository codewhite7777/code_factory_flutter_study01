import 'package:flutter/material.dart';
import 'package:navigation_pushnamed/layout/main_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route Two Screen',
      children: [
        Text(
          'argument : ${argument.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/');
          },
          child: const Text('Push named Pop'),
        ),
      ],
    );
  }
}
