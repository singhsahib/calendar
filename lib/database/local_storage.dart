import 'dart:convert';

import 'package:calendar/constants/names.dart';
import 'package:calendar/functions/security.dart';
import 'package:calendar/models/child/add_event.dart';
import 'package:calendar/models/child/event_item.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  Future<void> addEvent(AddEvent event) async {
    String eventId = Security.generateUID();
    final Box box = await Hive.openBox(EVENT_BOX);

    EventItem eventItem = event.toEventItem(eventId);

    await box.put(
      eventItem.eventStartDate.toIso8601String(),
      jsonEncode(eventItem.toJson()),
    );
  }

  Future<Map<String, EventItem>> getAllEvent() async {
    Map<String, EventItem> map = {};

    final Box box = await Hive.openBox(EVENT_BOX);

    box.keys.forEach((key) {
      if (key is String) {
        dynamic value = box.get(key);

        if (value is String) {
          Map json = jsonDecode(value);

          EventItem eventItem = EventItem.fromJson(json);

          map.putIfAbsent(key, () => eventItem);
        }
      }
    });

    return map;
  }
}
