import 'package:calendar/screens/day_screen.dart';
import 'package:calendar/screens/year_screen.dart';
import 'package:calendar_view/calendar_view.dart';

import 'screens/month_screen.dart';
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
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeClass.light_theme,
        darkTheme: ThemeClass.dark_theme,
        home: MainMonthScreen(),
        routes: {
          MainMonthScreen.routeName: (context) => const MainMonthScreen(),
          MainYearScreen.routeName: (context) => const MainYearScreen(),
          MainDayScreen.routeName: (context) => MainDayScreen(),
        },
      ),
    );
  }
}
