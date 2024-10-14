import 'package:flutter/material.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/pages/task.dart';
import 'package:flutterjul/controllers/task.dart' as taskController;
import 'package:flutterjul/services/services.dart';
import 'package:flutterjul/shared/sahred.dart';
import 'package:flutterjul/widgets/custom-dialog.dart';

Widget taskCard(Task task, fromWhere) {
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
              print(newTask);
              taskController.updateTaskData(task, newTask);
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
                  color: Color.fromARGB(255, 26, 25, 35)),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  "Created: ${formattedDate(task.createdDate)}",
                  style: const TextStyle(
                      fontSize: 14.0, color: Color.fromARGB(255, 26, 25, 25)),
                ),
                const Spacer(),
                Text(
                  "Deadline: ${formattedDate(task.deadline)}",
                  style: const TextStyle(
                      fontSize: 14.0, color: Color.fromARGB(255, 26, 25, 35)),
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
                                  body: "need to delete this task!",
                                  title: "Delete Task",
                                  cancelButtonText: 'No',
                                  okButtonText: "Yes")
                              .then((onValue) {
                            print(onValue);
                            if (onValue) {
                              taskController.deleteTask(task);
                            }
                          });
                        },
                  icon: Icon(
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