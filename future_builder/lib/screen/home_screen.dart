import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textstyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData == false) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Future Builder',
                    style: textstyle,
                  ),
                  Text('ConnectionState : ${snapshot.connectionState}'),
                  Text('Value : ${snapshot.data}'),
                  Text('Error : ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text('setState(...)'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<int> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    int number = Random().nextInt(100);
    return (number);
  }
}
