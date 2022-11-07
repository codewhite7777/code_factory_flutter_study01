import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                now: now,
                onChanged: onSelectedDate,
              ),
              const _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  void onSelectedDate(DateTime value) {
    setState(() {
      selectedDate = value;
    });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime now;
  final ValueChanged<DateTime> onChanged;

  const _TopPart(
      {required this.selectedDate,
      required this.now,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context);
    final textTheme = text.textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'U&I',
            style: text.textTheme.headlineLarge,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난 날',
                style: textTheme.headlineMedium,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) => Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: 300.0,
                    child: CupertinoDatePicker(
                      initialDateTime: selectedDate,
                      maximumDate: DateTime(now.year, now.month, now.day),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: onChanged,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
            color: Colors.redAccent,
            iconSize: 60.0,
          ),
          Text(
            'D+${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}',
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
