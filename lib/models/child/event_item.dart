import 'package:calendar/constants/colors.dart';
import 'package:calendar/constants/names.dart';
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
    List<Task>? task,
  }) : super(
          eventName: eventName,
          creationDate: creationDate,
          eventStartDate: eventStartDate,
          eventEndDate: eventEndDate,
          eventDescription: eventDescription,
          task: task,
        );

  Map toJson() => {
        EVENT_ID: this.eventId,
        ...super.toJson(),
      };

  static EventItem fromJson(Map json) {
    EventItem ei = EventItem(
      eventName: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
      eventDescription: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
      eventStartDate: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
      eventEndDate: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
      creationDate: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
      eventId: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : '',
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
    Color? color,
  }) {
    CalendarEventData calendarEventData = CalendarEventData(
      title: this.eventName,
      description: this.eventDescription,
      color: color == null ? CustomColors.gradient_color2 : color,
      date: this.eventStartDate,
      endDate: this.eventEndDate,
      startTime: startTime == null ? this.eventStartDate : startTime,
      endTime: endTime == null ? this.eventEndDate : endTime,
    );

    return calendarEventData;
  }
}
