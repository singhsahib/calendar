import 'package:calendar/constants/names.dart';
import 'package:calendar/models/child/event_item.dart';
import 'package:calendar/models/parent/event.dart';
import 'package:calendar/models/parent/task.dart';

class AddEvent extends Event {
  List<Task>? task;

  AddEvent({
    required String eventName,
    required DateTime creationDate,
    required DateTime eventStartDate,
    required DateTime eventEndDate,
    required String eventDescription,
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
            : List<dynamic>.from(this.task!.map((e) => e.toJson())),
        ...super.toJson(),
      };

  EventItem toEventItem(String eventId) {
    EventItem ei = EventItem(
      eventName: this.eventName,
      eventDescription: this.eventDescription,
      eventStartDate: this.eventStartDate,
      eventEndDate: this.eventEndDate,
      creationDate: this.creationDate,
      task: this.task,
      eventId: eventId,
    );

    return ei;
  }
}
