// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterjul/shared/task.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';
import 'package:flutterjul/widgets/task-card.dart';

class CompletedTasksPage extends StatefulWidget {
  const CompletedTasksPage({super.key});

  @override
  State<CompletedTasksPage> createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Completed Tasks Page"),
        titleTextStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          color: Colors.black,
         fontSize: 30.0,
        ),
        backgroundColor: const Color(0xFFD3B187),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          return taskCard(completedTasks[index], "Completed");
        },
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}