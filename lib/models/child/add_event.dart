import 'package:calendar/constants/colors.dart';
import 'package:calendar/constants/names.dart';
import 'package:calendar/models/child/event_item.dart';
import 'package:calendar/models/parent/event.dart';
import 'package:calendar/models/parent/task.dart';
import 'package:flutter/cupertino.dart';

class AddEvent extends Event {
  List<Task>? task;
  Color color;

  AddEvent({
    required String eventName,
    required DateTime creationDate,
    required DateTime eventStartDate,
    required DateTime eventEndDate,
    required String eventDescription,
    this.color = CustomColors.gradient_color2,
    this.task,
  }) : super(
          eventName: eventName,
          creationDate: creationDate,
          eventStartDate: eventStartDate,
          eventEndDate: eventEndDate,
          eventDescription: eventDescription,
        );

  Map toJson() => {
        TASK_KEY: this.task == null
            ? []
            : List<dynamic>.from(
                this.task!.map((e) => e.toJson()),
              ),
        COLOR: this.color.toString(),
        ...super.toJson(),
      };

  EventItem toEventItem(String eventId) {
    EventItem ei = EventItem(
      eventName: this.eventName,
      eventDescription: this.eventDescription,
      eventStartDate: this.eventStartDate,
      eventEndDate: this.eventEndDate,
      creationDate: this.creationDate,
      color: this.color,
      task: this.task,
      eventId: eventId,
    );

    return ei;
  }
}
