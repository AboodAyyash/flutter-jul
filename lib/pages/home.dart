import 'package:flutter/material.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/pages/task.dart';
import 'package:flutterjul/services/services.dart';
import 'package:flutterjul/shared/category.dart';
import 'package:flutterjul/shared/sahred.dart';
import 'package:flutterjul/shared/task.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';
import 'package:flutterjul/controllers/task.dart' as taskController;
import 'package:flutterjul/widgets/custom-dialog.dart';
import 'package:flutterjul/widgets/task-card.dart';
import 'package:flutterjul/controllers/category.dart' as categoryContrller;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryId = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskController.getTasks();
    categoryContrller.getCategories();
    allCategories.insert(
        0,
        Category(
          id: 0,
          name: "All",
          userId: user.id,
        ));
    taskStreamController.sink.add("event");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks App"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: taskStreamController.stream,
          builder: (context, snapshot) {
            print(snapshot.data);
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
                              taskController
                                  .getTasksByCategoryId(selectedCategoryId);
                              taskStreamController.sink.add("event");
                            },
                            child: Text(
                              allCategories[i].name,
                              style: TextStyle(
                                  color:
                                      selectedCategoryId == allCategories[i].id
                                          ? Colors.red
                                          : Colors.blue),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
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
                        taskController.search(value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: tasks.isEmpty
                      ? const Center(
                          child: Text("No Tasks Found!"),
                        )
                      : ListView.builder(
                          itemCount:
                              filterdTasks.isNotEmpty || selectedCategoryId != 0
                                  ? filterdTasks.length
                                  : userTasks.length,
                          itemBuilder: (context, index) {
                            return taskCard(
                                filterdTasks.isNotEmpty
                                    ? filterdTasks[index]
                                    : userTasks[index],
                                "Home");
                          },
                        ),
                ),
              ],
            );
          }),
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
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
