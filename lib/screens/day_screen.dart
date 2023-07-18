import 'package:flutter/material.dart';

class MainDayScreen extends StatelessWidget {
  static const String routeName = "day_screen";

  const MainDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _DayScreen();
  }
}

class _DayScreen extends StatefulWidget {
  const _DayScreen({Key? key}) : super(key: key);

  @override
  State<_DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<_DayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
