import 'package:calendar/constants/colors.dart';
import 'package:calendar/constants/size.dart';
import 'package:calendar/functions/common.dart';
import 'package:calendar_view/calendar_view.dart';
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
  EventController dayController = EventController();

  void addEvent(DateTime date) {
    print(date);
    CalendarEventData event = CalendarEventData(
      title: "Example",
      date: date,
      endDate: date,
      startTime: date,
      endTime: Common.getCurrentDate(
        hour: date.hour + 1,
        minute: date.minute,
        second: date.second,
      ),
      description: "asdasdasd",
    );

    dayController.add(event);
  }

  Future<void> getData() async {}

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).viewPadding.top;
    final double actualHeight = height - topPadding;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.third_dark,
      ),
      body: DayView(
        minDay: DateTime(1990),
        maxDay: DateTime(2050),
        initialDay: Common.getCurrentDate(),
        scrollPhysics: FixedExtentScrollPhysics(),
        pageViewPhysics: BouncingScrollPhysics(),
        // this is the header of this screen
        dayTitleBuilder: (DateTime date) {
          return Container();
        },

        backgroundColor: CustomColors.primary_dark,
        controller: dayController,
        eventTileBuilder: (date, events, boundry, start, end) {
          return Container(
            width: boundry.width,
            height: boundry.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  CustomSize.size(width, height, 8),
                ),
              ),
              color: CustomColors.gradient_color2,
            ),
            child: TextButton(
              onPressed: () {},
              onLongPress: () {},
              style: TextButton.styleFrom(
                primary: CustomColors.primary_light,
              ),
              child: Container(
                width: boundry.width,
                height: boundry.height,
                alignment: Alignment.center,
                child: Text("Event"),
              ),
            ),
          );
        },
        headerStyle: HeaderStyle(
          decoration: BoxDecoration(
            color: CustomColors.third_dark,
          ),
        ),
        showVerticalLine: false,
        showLiveTimeLineInAllDays: false,
        heightPerMinute: 1,
        eventArranger: SideEventArranger(),
        onEventTap: (events, date) => print(date),
        onDateTap: addEvent,
        onDateLongPress: (date) => print(date),
        minuteSlotSize: MinuteSlotSize.minutes15,
      ),
    );
  }
}
