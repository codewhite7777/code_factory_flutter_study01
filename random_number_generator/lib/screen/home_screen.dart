import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numList = [123, 456, 789];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '랜덤 숫자 생성기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    color: RED_COLOR,
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: numList
                      .asMap()
                      .entries
                      .map(
                        (entry) => Row(
                          children: entry.value
                              .toString()
                              .split('')
                              .map(
                                (x) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: (entry.key == 2) ? 0 : 16.0),
                                  child: Image.asset(
                                    'asset/img/$x.png',
                                    height: 70.0,
                                    width: 50.0,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: RED_COLOR,
                      ),
                      onPressed: () {
                        Set<int> generateNumber = {};
                        while (generateNumber.length != 3) {
                          final int newNumber = Random().nextInt(maxNumber);
                          generateNumber.add(newNumber);
                        }
                        setState(() {
                          numList = generateNumber.toList();
                        });
                      },
                      child: const Text('생성하기'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
