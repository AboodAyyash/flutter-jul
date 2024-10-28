// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/services/services.dart';
import 'package:flutterjul/shared/category.dart';
import 'package:flutterjul/shared/shared.dart';
import 'package:flutterjul/shared/task.dart';
import 'package:flutterjul/controllers/task.dart' as taskController;

class TaskPage extends StatefulWidget {
  final Task? task;
  const TaskPage({super.key, this.task});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late Task task;
  DateTime deadline = DateTime.now();
  String desc = '';
  String name = '';
  final TextEditingController deadlineCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController descCon = TextEditingController();
  bool isEditPage = false;
  Category selectedCategory = categories[0];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      task = widget.task!;
      if (task.id != 0) {
        nameCon.text = task.name;
        descCon.text = task.description;
        deadlineCon.text = formattedDate(task.deadline);
        selectedCategory =
            categories.firstWhere((cat) => cat.id == task.categoryId);
      }
    } else {
      deadlineCon.text = formattedDate(deadline);
    }
  }

  @override
  void dispose() {
    deadlineCon.dispose();
    nameCon.dispose();
    descCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, task);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(task.id == 0
              ? "Add Task Page"
              : isEditPage
                  ? "Edit Task Page"
                  : "Task Details Page"),
          centerTitle: true,
          actions: [
            if (task.id != 0)
              !isEditPage
                  ? IconButton(
                      onPressed: () => setState(() => isEditPage = !isEditPage),
                      icon: const Icon(Icons.edit),
                    )
                  : IconButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          taskController.updateTask(
                              Task(
                                id: task.id,
                                userId: task.userId,
                                name: nameCon.text,
                                description: descCon.text,
                                deadline: deadline,
                                createdDate: task.createdDate,
                                categoryId: selectedCategory.id,
                                isChecked: task.isChecked,
                              ),
                              Task(
                                id: task.id,
                                userId: task.userId,
                                name: nameCon.text,
                                description: descCon.text,
                                deadline: deadline,
                                createdDate: task.createdDate,
                                categoryId: selectedCategory.id,
                                isChecked: task.isChecked,
                              ));
                          setState(() => isEditPage = !isEditPage);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Task updated successfully')));
                        }
                      },
                      icon: const Icon(Icons.save),
                    ),
          ],
        ),
        body: task.id != 0 ? taskDetailsWidget() : addTaskWidget(),
      ),
    );
  }

  Widget taskDetailsWidget() {
    return isEditPage
        ? addTaskWidget()
        : ListView(
            children: [
              ListTile(
                title: const Text("Name"),
                subtitle: Text(task.name),
              ),
              ListTile(
                title: const Text("Description"),
                subtitle: Text(task.description),
              ),
              ListTile(
                title: const Text("Created Date"),
                subtitle: Text(formattedDate(task.createdDate)),
              ),
              ListTile(
                title: const Text("Deadline Date"),
                subtitle: Text(formattedDate(task.deadline)),
              ),
            ],
          );
  }

  Widget addTaskWidget() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameCon,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter Task Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter task name';
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: descCon,
                decoration: const InputDecoration(
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
              margin: const EdgeInsets.all(10),
              child: TextField(
                readOnly: true,
                controller: deadlineCon,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Dead Line",
                  hintText: "Enter Task Dead Line",
                ),
                onTap: () {
                  selectDate();
                },
              ),
            ),
            DropdownButton<Category>(
              items: categories.map((Category category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  print(value);
                  selectedCategory = value!;
                });
              },
              value: selectedCategory,
            ),
            if (!isEditPage)
              TextButton(
                onPressed: () {
                  task = Task(
                    categoryId: selectedCategory.id,
                    userId: user.id,
                    createdDate: DateTime.now(),
                    deadline: deadline,
                    description: desc,
                    name: name,
                    id: tasks.length + 1,
                    isChecked: false,
                  );
                  taskController.addTask(task);
                },
                child: const Text("Add Task"),
              ),
          ],
        ));
  }

  Future<void> selectDate() async {
    await showDatePicker(
      context: context,
      initialDate: deadline,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ).then((onValue) {
      if (onValue != null) {
        setState(() {
          deadline = DateTime(
            onValue.year,
            onValue.month,
            onValue.day,
            deadline.hour,
            deadline.minute,
          );

          selectTime();
        });
      }
    });
  }

  Future<void> selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(deadline),
    );
    if (picked != null) {
      setState(() {
        deadline = DateTime(
          deadline.year,
          deadline.month,
          deadline.day,
          picked.hour,
          picked.minute,
        );

        deadlineCon.text = formattedDate(deadline).toString();
      });
    }
  }
}
