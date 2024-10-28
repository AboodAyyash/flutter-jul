// ignore_for_file: avoid_print, depend_on_referenced_packages, library_prefixes

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterjul/DB/category.dart' as categoryDB;
import 'package:flutterjul/DB/task.dart' as taskDB;
import 'package:flutterjul/controllers/task.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/pages/task.dart';
import 'package:flutterjul/shared/category.dart';
import 'package:flutterjul/shared/shared.dart';
import 'package:flutterjul/shared/task.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';
import 'package:flutterjul/widgets/task-card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryId = 0;

  final taskStreamController = StreamController<String>();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    allCategories =
        await categoryDB.CategoryDatabase.instance.getAllCategories();
    categories = await categoryDB.CategoryDatabase.instance.getAllCategories();
    allCategories.insert(
      0,
      Category(id: 0, name: "All", userId: user.id),
    );

    await getTasks().then((onValue) {
      taskStreamController.sink.add("event");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks App"),
        centerTitle: true,
      ),
      body: StreamBuilder<String>(
        stream: taskStreamController.stream,
        builder: (context, snapshot) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < allCategories.length; i++)
                        TextButton(
                          onPressed: () {
                            selectedCategoryId = allCategories[i].id;
                            filteredTasks;
                            taskStreamController.sink.add("event");
                          },
                          child: Text(
                            allCategories[i].name,
                            style: TextStyle(
                              color: selectedCategoryId == allCategories[i].id
                                  ? Colors.red
                                  : Colors.blue,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Search",
                      hintText: "Enter Task Name",
                    ),
                    onChanged: (value) {
                      filteredTasks;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: userTasks.isEmpty
                    ? const Center(
                        child: Text("No Tasks Found!"),
                      )
                    : ListView.builder(
                        itemCount:
                            filteredTasks.isNotEmpty || selectedCategoryId != 0
                                ? filteredTasks.length
                                : userTasks.length,
                        itemBuilder: (context, index) {
                          return taskCard(
                              filteredTasks.isNotEmpty
                                  ? filteredTasks[index]
                                  : userTasks[index],
                              "Home");
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Task emptyTask = Task(
            name: "",
            id: 0,
            description: "",
            userId: user.id,
            deadline: DateTime.now(),
            createdDate: DateTime.now(),
            categoryId: 0,
            isChecked: false,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TaskPage(
                task: emptyTask,
              ),
            ),
          ).then((onValue) {
            if (onValue == 'add task') {
              print("enter");
              taskStreamController.sink.add("event");
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
