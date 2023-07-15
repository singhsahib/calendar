import './screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../constants/themes.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.light_theme,
      darkTheme: ThemeClass.dark_theme,
      home: MainHomeScreen(),
      routes: {
        MainHomeScreen.route_name: (context) => const MainHomeScreen(),
      },
    );
  }
}
