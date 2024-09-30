import 'package:flutter/material.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/services/services.dart';
import 'package:flutterjul/shared/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late Task task;

  DateTime deadLine = DateTime.now();

  String desc = '';
  String name = '';
  TextEditingController deadLineCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: "Enter Task Name",
              ),
              onChanged: (value) {
                name = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Description",
                hintText: "Enter Task Description",
              ),
              onChanged: (value) {
                desc = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              readOnly: true,
              controller: deadLineCon,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Dead Line",
                hintText: "Enter Task Dead Line",
              ),
              onTap: () {
                selectDate();
              },
            ),
          ),
          TextButton(
            onPressed: () {
              task = Task(
                categoryId: 1,
                createdDate: DateTime.now(),
                deadline: deadLine,
                description: desc,
                name: name,
                id: tasks.length + 1,
                isChecked: false,
              );
              tasks.add(task);
              Navigator.pop(context, "add task");
            },
            child: Text("Add Task"),
          ),
        ],
      ),
    );
  }

  Future<void> selectDate() async {
    await showDatePicker(
      context: context,
      initialDate: deadLine,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ).then((onValue) {
      if (onValue != null) {
        setState(() {
          deadLine = onValue;

          selectTime();
        });
      }
    });
  }

  Future<void> selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(deadLine),
    );
    if (picked != null) {
      setState(() {
        deadLine = DateTime(
          deadLine.year,
          deadLine.month,
          deadLine.day,
          picked.hour,
          picked.minute,
        );

        deadLineCon.text = formattedDate(deadLine).toString();
      });
    }
  }
}
