import 'package:flutterjul/models/task.dart';

List tasks = [
  Task(
    categoryId: 1,
    createdDate: DateTime(2024, 9, 25),
    deadline: DateTime(2024, 9, 27),
    description: "Description",
    id: 1,
    isChecked: false,
    name: "Task 1 Task 1 Task 1 Task 1 Task 1Task 1Task 1Task 1Task 1",
  ),
  Task(
    categoryId: 2,
    createdDate: DateTime.now(),
    deadline: DateTime.now(),
    description: "Description",
    id: 2,
    isChecked: false,
    name: "Task 2",
  ),
];
List filterdTasks = [];
List completedTasks = [];
bool showSnakBar = false;
