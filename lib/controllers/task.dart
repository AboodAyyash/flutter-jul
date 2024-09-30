import 'package:flutter/material.dart';
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
