import 'package:flutter/material.dart';

class MainYearScreen extends StatelessWidget {
  static const String routeName = "year_screen";

  const MainYearScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _YearScreen();
  }
}

class _YearScreen extends StatefulWidget {
  const _YearScreen({Key? key}) : super(key: key);

  @override
  State<_YearScreen> createState() => _YearScreenState();
}

class _YearScreenState extends State<_YearScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
