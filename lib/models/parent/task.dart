import 'package:calendar/constants/names.dart';

class Task {
  String taskTitle;
  String taskDescription;
  bool checklist;

  Task({
    required this.taskTitle,
    required this.taskDescription,
    this.checklist = false,
  });

  toJson() => {
        TASK_TITLE: this.taskTitle,
        TASK_DESCRIPTION: this.taskDescription,
        CHECKLIST: this.checklist,
      };

  static Task fromJson(Map json) {
    return Task(
      taskTitle: json.containsKey(TASK_TITLE) ? json[TASK_TITLE] : '',
      taskDescription:
          json.containsKey(TASK_DESCRIPTION) ? json[TASK_DESCRIPTION] : '',
      checklist: json.containsKey(CHECKLIST) ? json[CHECKLIST] : false,
    );
  }
}
