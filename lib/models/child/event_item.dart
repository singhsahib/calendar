import 'package:calendar/constants/colors.dart';
import 'package:calendar/constants/names.dart';
import 'package:calendar/functions/common.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';

import '../parent/task.dart';
import './add_event.dart';

class EventItem extends AddEvent {
  String eventId;

  EventItem({
    required String eventName,
    required String eventDescription,
    required DateTime eventStartDate,
    required DateTime eventEndDate,
    required DateTime creationDate,
    required this.eventId,
    Color? color,
    List<Task>? task,
  }) : super(
          eventName: eventName,
          creationDate: creationDate,
          eventStartDate: eventStartDate,
          eventEndDate: eventEndDate,
          eventDescription: eventDescription,
          color: color == null ? CustomColors.gradient_color2 : color,
          task: task,
        );

  Map toJson() => {
        EVENT_ID: this.eventId,
        ...super.toJson(),
      };

  static EventItem fromJson(Map json) {
    Color? newColor;

    if (json.containsKey(COLOR)) {
      String valueString = json[COLOR].split('(0x')[1].split(')')[0];
      int value = int.parse(valueString, radix: 16);
      newColor = new Color(value);
    }

    EventItem ei = EventItem(
      eventName: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
      eventDescription:
          json.containsKey(EVENT_DESCRIPTION) ? json[EVENT_DESCRIPTION] : '',
      eventStartDate: json.containsKey(EVENT_START_DATE)
          ? Common.dateTimeDecode(json[EVENT_START_DATE])
          : Common.getCurrentDate(),
      eventEndDate: json.containsKey(EVENT_END_DATE)
          ? Common.dateTimeDecode(json[EVENT_END_DATE])
          : Common.getCurrentDate(),
      creationDate: json.containsKey(CREATION_DATE)
          ? Common.dateTimeDecode(json[CREATION_DATE])
          : Common.getCurrentDate(),
      eventId: json.containsKey(EVENT_ID) ? json[EVENT_ID] : '',
      color: newColor,
      task: json.containsKey(TASK_KEY)
          ? json[TASK_KEY] is List
              ? List<Task>.from(
                  json[TASK_KEY].map((e) => Task.fromJson(e)),
                )
              : []
          : [],
    );

    return ei;
  }

  CalendarEventData toCalendarEventData({
    DateTime? startTime,
    DateTime? endTime,
  }) {
    CalendarEventData calendarEventData = CalendarEventData(
      title: this.eventName,
      description: this.eventDescription,
      color: this.color,
      date: this.eventStartDate,
      endDate: this.eventEndDate,
      startTime: startTime == null ? this.eventStartDate : startTime,
      endTime: endTime == null ? this.eventEndDate : endTime,
    );

    return calendarEventData;
  }
}
