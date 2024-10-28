// ignore_for_file: avoid_print, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/pages/task.dart';
import 'package:flutterjul/controllers/task.dart' as taskController;
import 'package:flutterjul/services/services.dart';
import 'package:flutterjul/shared/shared.dart';
import 'package:flutterjul/widgets/custom-dailog.dart';

Widget taskCard(Task task, String fromWhere) {
  return InkWell(
    onTap: fromWhere == "Completed"
        ? null
        : () {
            Navigator.push(
              navigatorKey.currentState!.context,
              MaterialPageRoute(
                builder: (BuildContext context) => TaskPage(
                  task: task,
                ),
              ),
            ).then((newTask) {
              if (newTask != null) {
                taskController.updateTask(task, newTask);
              }
            });
          },
    child: Card(
      color: const Color(0xFF90B4F2),
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 26, 25, 35),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Created: ${formattedDate(task.createdDate)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 26, 25, 35),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Deadline: ${formattedDate(task.deadline)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 26, 25, 35),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              task.description,
              style: const TextStyle(fontSize: 14.0),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: task.isChecked,
                  onChanged: fromWhere == "Completed"
                      ? null
                      : (value) {
                          task.isChecked = value!;
                          taskController.completeTask(task);
                          taskStreamController.sink.add("update Task");
                        },
                  activeColor: const Color(0xFF6898EE),
                ),
                IconButton(
                  onPressed: fromWhere == "Completed"
                      ? null
                      : () {
                          showCustomDialog(
                            body: "Are you sure that you want to delete this task!",
                            title: "Delete Task",
                            cancelButtonText: 'No',
                            okButtonText: "Yes",
                          ).then((onValue) {
                            if (onValue) {
                              taskController.deleteTask(task);
                            }
                          });
                        },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}