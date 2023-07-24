import 'package:calendar/constants/names.dart';
import 'package:calendar/models/parent/task.dart';

class TaskItem extends Task {
  String taskId;

  TaskItem({
    required String taskTitle,
    required String taskDescription,
    required this.taskId,
    bool? checklist,
  }) : super(
          taskTitle: taskTitle,
          taskDescription: taskDescription,
          checklist: checklist == null ? false : checklist,
        );

  Map toJson() => {
        ...super.toJson(),
        TASK_ID: this.taskId,
      };

  static TaskItem fromJson(Map json) {
    return TaskItem(
      taskTitle: json.containsKey(TASK_TITLE) ? json[TASK_TITLE] : '',
      taskDescription:
          json.containsKey(TASK_DESCRIPTION) ? json[TASK_DESCRIPTION] : '',
      checklist: json.containsKey(CHECKLIST) ? json[CHECKLIST] : '',
      taskId: json.containsKey(TASK_ID) ? json[TASK_ID] : '',
    );
  }
}
