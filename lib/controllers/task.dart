import 'package:flutter/material.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/shared/sahred.dart';
import 'package:flutterjul/shared/task.dart';

void search(value) {
  filterdTasks = tasks
      .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase()))
      .toList();

  if (filterdTasks.isEmpty && !showSnakBar) {
    showSnakBar = true;
    ScaffoldFeatureController scaffoldFeatureController =
        ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      const SnackBar(
        content: Text('There is no data found'),
      ),
    );

    scaffoldFeatureController.closed.then((onValue) {
      showSnakBar = false;
    });
  }
  taskStreamController.sink.add("update Task");
}

void updateTaskData(Task oldTask, Task newTask) {
  int index = tasks.indexOf(oldTask);
  tasks.removeAt(index);
  tasks.insert(index, newTask);
  taskStreamController.sink.add("update Task");
}

void deleteTask(Task task) {
  int index = tasks.indexOf(task);
  tasks.removeAt(index);

  taskStreamController.sink.add("update Task");
}
