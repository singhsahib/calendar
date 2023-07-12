import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  static const String route_name = "/home_screen";

  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        child: Text("This is a Dummy Home Screen"),
      ),
    );
  }
}
