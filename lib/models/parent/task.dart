import 'package:calendar/constants/names.dart';

class Task {
  List<String> actionList;
  bool checklist;

  Task({
    required this.actionList,
    this.checklist = true,
  });

  toJson() => {
        ACTION_LIST: this.actionList,
        CHECKLIST: this.checklist,
      };

  static Task fromJson(Map json) {
    return Task(
      actionList: json.containsKey(ACTION_LIST) ? json[ACTION_LIST] : [],
      checklist: json.containsKey(CHECKLIST) ? json[CHECKLIST] : true,
    );
  }
}
