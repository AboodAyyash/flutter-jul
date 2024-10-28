import 'package:flutter/material.dart';
import '../DB/category.dart';
import '../models/category.dart';
import '../models/task.dart';
import 'task.dart';
import '../services/services.dart';
import '../shared/category.dart';
import '../shared/sahred.dart';
import '../shared/task.dart';
import '../widgets/custom-bnb.dart';
import '../controllers/task.dart' as taskController;
import '../widgets/custom-dialog.dart';
import '../widgets/task-card.dart';
import '../controllers/category.dart' as categoryContrller;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryId = 0;
  CategoryDatabase categoryDatabase = CategoryDatabase.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    taskController.getTasks();
    await categoryContrller.getCategories();
    allCategories.insert(
        0,
        Category(
          id: 0,
          name: "All",
          userId: user.id,
        ));
    taskStreamController.sink.add("event");

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
