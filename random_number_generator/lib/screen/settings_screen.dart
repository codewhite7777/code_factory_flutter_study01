import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  double settingNumber;

  SettingsScreen({required this.settingNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double? settingNumber;
  final double minNumber = 1000;
  final double maxNumber = 100000;

  @override
  void initState() {
    super.initState();
    settingNumber ??= widget.settingNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _Body(settingNumber: settingNumber!),
              _Fotter(
                maxNumber: maxNumber,
                minNumber: minNumber,
                settingNumber: settingNumber!,
                onSliderChanged: onSliderChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double value) {
    setState(() {
      settingNumber = value;
    });
  }
}

class _Body extends StatelessWidget {
  final double settingNumber;

  const _Body({required this.settingNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: settingNumber!
            .toInt()
            .toString()
            .split('')
            .map(
              (e) => Image.asset(
                'asset/img/$e.png',
                width: 50.0,
                height: 70.0,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Fotter extends StatelessWidget {
  final double minNumber;
  final double maxNumber;
  final double settingNumber;
  final ValueChanged<double> onSliderChanged;

  const _Fotter(
      {required this.minNumber,
      required this.maxNumber,
      required this.settingNumber,
      required this.onSliderChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: minNumber,
          max: maxNumber,
          value: settingNumber!,
          onChanged: onSliderChanged,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RED_COLOR,
                ),
                onPressed: () {
                  Navigator.of(context).pop(settingNumber!.toInt());
                },
                child: const Text('저장'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
