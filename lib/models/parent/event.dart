import 'package:calendar/constants/names.dart';
import 'package:calendar/functions/common.dart';

class Event {
  String eventName;
  DateTime creationDate;
  DateTime eventStartDate;
  DateTime eventEndDate;
  String eventDescription;

  Event({
    required this.eventName,
    required this.creationDate,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDescription,
  });

  Map toJson() => {
        EVENT_NAME: this.eventName,
        CREATION_DATE: Common.dateTimeEncode(this.creationDate),
        EVENT_START_DATE: Common.dateTimeEncode(this.eventStartDate),
        EVENT_END_DATE: Common.dateTimeEncode(this.eventEndDate),
        EVENT_DESCRIPTION: this.eventDescription,
      };

  static Event fromJson(Map json) {
    return Event(
      eventName: json.containsKey(EVENT_NAME) ? json[EVENT_NAME] : "",
      creationDate: json.containsKey(CREATION_DATE)
          ? Common.dateTimeDecode(json[CREATION_DATE])
          : Common.getCurrentDate(),
      eventStartDate: json.containsKey(EVENT_START_DATE)
          ? Common.dateTimeDecode(json[EVENT_START_DATE])
          : Common.getCurrentDate(),
      eventEndDate: json.containsKey(EVENT_END_DATE)
          ? Common.dateTimeDecode(json[EVENT_END_DATE])
          : Common.getCurrentDate(),
      eventDescription:
          json.containsKey(EVENT_DESCRIPTION) ? json[EVENT_DESCRIPTION] : "",
    );
  }
}
