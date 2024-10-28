import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterjul/DB/task.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/shared/shared.dart';
import 'package:flutterjul/shared/task.dart';

void search(String value) {
  filteredTasks = tasks
      .where(
          (element) => element.name.toLowerCase().contains(value.toLowerCase()))
      .toList();

  if (filteredTasks.isEmpty && !showSnakBar) {
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

List getTasksByCategoryId(int categoryId) {
  if (categoryId == 0) {
    filteredTasks = tasks;
  } else {
    filteredTasks =
        tasks.where((element) => element.categoryId == categoryId).toList();
  }

  taskStreamController.sink.add("update Task");
  return filteredTasks;
}

void updateTask(Task oldTask, Task newTask) {
  TaskDatabase taskDatabase = TaskDatabase.instance;
  int index = tasks.indexOf(oldTask);
  tasks.removeAt(index);
  tasks.insert(index, newTask);
  taskDatabase.update(convertTaskData(newTask));
  getTasks();
  taskStreamController.sink.add("update Task");
}

void deleteTask(Task task) {
  TaskDatabase taskDatabase = TaskDatabase.instance;
  int index = tasks.indexOf(task);
  tasks.removeAt(index);
  taskDatabase.delete(convertTaskData(task));
  getTasks();
  taskStreamController.sink.add("update Task");
}

void completeTask(Task task) {
  int index = tasks.indexOf(task);
  tasks.removeAt(index);

  completedTasks.add(task);
  getTasks();
  taskStreamController.sink.add("update Task");
}

Future getTasks() async {
  userTasks = [];
  await TaskDatabase.instance.getAllTasks().then((onValue) {
    print("onValue2 $onValue");
    for (var i = 0; i < onValue.length; i++) {
      tasks.add(convertTaskDataToModel(onValue[i]));
    }
  });
  print(tasks);
  for (var i = 0; i < tasks.length; i++) {
    if (tasks[i].userId == user.id) {
      userTasks.add(tasks[i]);
    }
  }

  for (var task in filteredTasks) {
    task.deadline = DateTime.parse(task.deadline as String);
    task.createdDate = DateTime.parse(task.createdDate as String);
    task.isChecked = task.isChecked == true ? true : false;
  }

  taskStreamController.sink.add("update Task");
}

addTask(task) {
  TaskDatabase taskDatabase = TaskDatabase.instance;

  taskDatabase.create(convertTaskData(task));
  tasks.add(task);
  getTasks();
  Navigator.pop(navigatorKey.currentState!.context, "add task");
}

Map<String, Object> convertTaskData(Task task) {
  Map<String, Object> newTask = {};

  if (task.isChecked == true) {
    newTask['isChecked'] = 1;
  } else if (task.isChecked == false) {
    newTask['isChecked'] = 0;
  }

  newTask['createdDate'] = task.createdDate.toString();
  newTask['deadline'] = task.deadline.toString();
  newTask['name'] = task.name.toString();
  newTask['id'] = task.id;
  newTask['categoryId'] = task.categoryId;
  newTask['userId'] = task.userId;
  newTask['description '] = task.description;
  return newTask;
}

Task convertTaskDataToModel(task) {
  Task newTask = Task(
    name: task['name'],
    id: task['id'],
    description: task['description'],
    deadline: DateTime.parse(task['deadline'] as String),
    createdDate: DateTime.parse(task['createdDate'] as String),
    categoryId: task['categoryId'],
    isChecked: task['isChecked'] == 0 ? false : true,
    userId: task['userId'],
  );

  return newTask;
}
