import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numList = [123, 456, 789];
  int settingNumber = 1000;

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
              _Header(
                settingNumber: settingNumber,
                onSettingPop: onSettingSave,
              ),
              _Body(numList: numList),
              _Fotter(
                onPressed: onRandomNumberGenerate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {
    Set<int> generateNumber = {};
    while (generateNumber.length != 3) {
      final int newNumber = Random().nextInt(settingNumber);
      generateNumber.add(newNumber);
    }
    setState(() {
      numList = generateNumber.toList();
    });
  }

  void onSettingSave() async {
    final int? result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) => SettingsScreen(
          settingNumber: settingNumber.toDouble(),
        ),
      ),
    );
    if (result != null) {
      setState(() {
        settingNumber = result;
      });
    }
  }
}

class _Header extends StatelessWidget {
  int settingNumber;
  final VoidCallback onSettingPop;

  _Header({required this.settingNumber, required this.onSettingPop, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: onSettingPop,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numList;

  const _Body({required this.numList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

class _Fotter extends StatelessWidget {
  final VoidCallback onPressed;

  const _Fotter({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: RED_COLOR,
            ),
            onPressed: onPressed,
            child: const Text('생성하기'),
          ),
        ),
      ],
    );
  }
}
