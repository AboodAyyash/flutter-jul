import 'package:flutter/material.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/services/services.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasks = [
    Task(
      categoryId: 1,
      createdDate: DateTime(2024, 9, 25),
      deadline: DateTime(2024, 9, 27),
      description: "DEscription",
      id: 1,
      isChecked: false,
      name: "Task 1",
    ),
    Task(
      categoryId: 1,
      createdDate: DateTime.now(),
      deadline: DateTime.now(),
      description: "DEscription",
      id: 2,
      isChecked: false,
      name: "Task 2",
    ),
  ];
  List filterdTasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  hintText: "Enter Task Name",
                ),
                onChanged: (value) {
                  search(value);
                },
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount:
                  filterdTasks.isNotEmpty ? filterdTasks.length : tasks.length,
              itemBuilder: (context, index) {
                return taskCard(
                  filterdTasks.isNotEmpty ? filterdTasks[index] : tasks[index],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: customBNB(),
    );
  }

  void search(value) {
    setState(() {
      filterdTasks = tasks
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()))
          .toList();
    });
  }

  Widget taskCard(Task task) {
    return Card(
      child: Column(
        children: [
          Text(task.name),
          Text(formattedDate(task.createdDate)),
          Text(formattedDate(task.deadline)),
          Text(task.description),
          Checkbox(
            value: task.isChecked,
            onChanged: (value) {
              setState(() {
                task.isChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
