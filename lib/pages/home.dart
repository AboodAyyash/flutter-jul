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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> allCategories = categories;
  int selectedCategoryId = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCategories.insert(0, Category(id: 0, name: "All"));
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
                        for (int i = 0; i < categories.length; i++)
                          TextButton(
                            onPressed: () {
                              selectedCategoryId = categories[i].id;
                              taskController
                                  .getTasksByCategoryId(selectedCategoryId);
                              taskStreamController.sink.add("event");
                            },
                            child: Text(
                              categories[i].name,
                              style: TextStyle(
                                  color: selectedCategoryId == categories[i].id
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
                                  : tasks.length,
                          itemBuilder: (context, index) {
                            return taskCard(
                              filterdTasks.isNotEmpty
                                  ? filterdTasks[index]
                                  : tasks[index],
                            );
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

  Widget taskCard(Task task) {
    return /*  selectedCategoryId == task.id || selectedCategoryId == 0
        ? */
        InkWell(
      onTap: () {
        Navigator.push(
          context,
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
                    onChanged: (value) {
                      setState(() {
                        task.isChecked = value!;
                      });
                    },
                    activeColor: const Color(0xFF6898EE),
                  ),
                  IconButton(
                    onPressed: () {
                      taskController.deleteTask(task);
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
    ) /*  : Container() */;
  }

}
