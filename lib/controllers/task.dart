import 'package:flutter/material.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/shared/sahred.dart';
import 'package:flutterjul/shared/task.dart';

void search(value) {
  filterdTasks = userTasks
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

getTasksByCategoryId(categryId) {
  if (categryId == 0)
    filterdTasks = userTasks;
  else {
    filterdTasks = userTasks
        .where((element) =>
            element.categoryId.toString().contains(categryId.toString()))
        .toList();
  }
  print(filterdTasks);
  taskStreamController.sink.add("update Task");
}

void updateTaskData(Task oldTask, Task newTask) {
  int index = tasks.indexOf(oldTask);
  tasks.removeAt(index);
  tasks.insert(index, newTask);
  getTasks();
  taskStreamController.sink.add("update Task");
}

void deleteTask(Task task) {
  int index = tasks.indexOf(task);
  tasks.removeAt(index);
  getTasks();
  taskStreamController.sink.add("update Task");
}

void completeTask(Task task) {
  int index = tasks.indexOf(task);
  tasks.removeAt(index);
  print(task.name);
  completedTasks.add(task);
  getTasks();
  taskStreamController.sink.add("update Task");
}

getTasks() {
  userTasks = [];
  for (var i = 0; i < tasks.length; i++) {
    if (tasks[i].userId == user.id) {
      userTasks.add(tasks[i]);
    }
  }
  taskStreamController.sink.add("update Task");
}
