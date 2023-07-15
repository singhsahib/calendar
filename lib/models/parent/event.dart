import 'package:calendar/constants/names.dart';

class Event {
  String eventName;
  DateTime creationDate;
  DateTime eventDate;

  Event({
    required this.eventName,
    required this.creationDate,
    required this.eventDate,
  });

  Map toJson() => {
        EVENT_NAME: this.eventName,
        CREATION_DATE: this.creationDate,
        EVENT_DATE: this.eventDate,
      };

  static Event fromJson(Map json) {
    return Event(
      eventName: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : "",
      creationDate: json.containsKey(CREATION_DATE)
          ? json[CREATION_DATE]
          : DateTime.now(),
      eventDate:
          json.containsKey(EVENT_DATE) ? json[EVENT_DATE] : DateTime.now(),
    );
  }
}
