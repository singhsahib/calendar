import 'package:calendar/constants/colors.dart';
import 'package:calendar/constants/size.dart';
import 'package:calendar/screens/day_screen.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class MainMonthScreen extends StatelessWidget {
  static const String routeName = "/home_screen";

  const MainMonthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MonthScreen();
  }
}

class _MonthScreen extends StatefulWidget {
  const _MonthScreen({Key? key}) : super(key: key);

  @override
  State<_MonthScreen> createState() => _MonthScreenState();
}

class _MonthScreenState extends State<_MonthScreen> {
  final List<String> weekDayList = ["M", "T", "W", "T", "F", "S", "S"];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).viewPadding.top;
    final double actualHeight = height - topPadding;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.third_dark,
      ),
      body: SafeArea(
        child: Container(
          width: width,
          height: actualHeight,
          child: MonthView(
              startDay: WeekDays.sunday,
              // minMonth: DateTime(1990,),
              // maxMonth: DateTime(2050),
              // initialMonth: DateTime(2021),
              // borderSize: 0,
              showBorder: false,
              headerBuilder: (DateTime date) {
                return Container();
              },
              weekDayBuilder: (int value) {
                return Container(
                  width: CustomSize.getWidth(width, 50),
                  height: CustomSize.getHeight(height, 20),
                  alignment: Alignment.center,
                  color: CustomColors.third_dark,
                  child: Text(
                    weekDayList[value],
                    style: TextStyle(
                      fontSize: CustomSize.size(width, height, 12),
                      fontWeight: FontWeight.bold,
                      color: value == 6 || value == 5
                          ? CustomColors.light_grey
                          : CustomColors.primary_light,
                    ),
                  ),
                );
              },
              cellBuilder: (date, events, isToday, isInMonth) {
                // Return your widget to display as month cell.
                return Container(
                  width: CustomSize.getWidth(width, 50),
                  // height: 150,
                  decoration: BoxDecoration(
                    color: isToday ? CustomColors.gradient_color2 : null,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: isInMonth
                      ? TextButton(
                          onPressed: () {},
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: CustomSize.size(width, height, 18),
                            ),
                          ),
                        )
                      : null,
                );
              },
              // cellAspectRatio: 1 / 2,
              onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
              onCellTap: (events, date) {
                Navigator.of(context).pushNamed(MainDayScreen.routeName);
              },
              onEventTap: (event, date) => print(event),
              onDateLongPress: (date) => print(date)),
        ),
      ),
    );
  }
}
