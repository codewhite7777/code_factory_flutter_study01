import 'package:flutter/material.dart';
import 'package:navigation_argument/layout/main_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route Two Screen',
      children: [
        Text(
          'data from argument : ${arguments.toString()}',
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
