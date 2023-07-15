import 'package:calendar/constants/names.dart';
import 'package:calendar/models/parent/event.dart';
import 'package:calendar/models/parent/task.dart';

class AddEvent extends Event {
  Task task;

  AddEvent({
    required String eventName,
    required DateTime creationDate,
    required DateTime eventDate,
    required this.task,
  }) : super(
          eventName: eventName,
          eventDate: eventDate,
          creationDate: creationDate,
        );

  Map toJson() => {
        TASK_KEY: this.task.toJson(),
        ...super.toJson(),
      };
}
