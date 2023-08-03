import 'dart:convert';

import 'package:calendar/constants/names.dart';
import 'package:calendar/functions/common.dart';
import 'package:calendar/functions/security.dart';
import 'package:calendar/models/child/add_event.dart';
import 'package:calendar/models/child/event_item.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  static Future<EventItem> addEvent(AddEvent event) async {
    String eventId = Security.generateUID();
    final Box box = await Hive.openBox(EVENT_BOX);

    EventItem eventItem = event.toEventItem(eventId);

    await box.put(
      Common.dateTimeEncode(eventItem.eventStartDate),
      jsonEncode(eventItem.toJson()),
    );

    return eventItem;
  }

  static Future<Map<String, EventItem>> getAllEvent() async {
    Map<String, EventItem> map = {};

    final Box box = await Hive.openBox(EVENT_BOX);

    box.keys.forEach((key) {
      // print(key);
      if (key is String) {
        dynamic value = box.get(key);

        // print(value);
        if (value is String) {
          Map json = jsonDecode(value);

          // print(json);

          EventItem eventItem = EventItem.fromJson(json);

          // print("here we are converting to object");

          map.putIfAbsent(key, () => eventItem);
        }
      }
    });

    return map;
  }
}
