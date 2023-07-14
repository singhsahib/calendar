import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  static const String route_name = "/home_screen";

  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _HomeScreen();
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: width,
        height: height,
        child: Text("Something here"),
      ),
    );
  }
}
