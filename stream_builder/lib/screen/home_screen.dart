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
        title: const Text('StreamBuilder'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder(
            stream: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData == false) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Stream Builder',
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

  Stream<int> getData() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      int number = Random().nextInt(100);
      yield (number);
    }
  }
}
