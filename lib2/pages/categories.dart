import 'package:flutter/material.dart';
import '../models/category.dart';
import 'category.dart';
import '../shared/category.dart';
import '../shared/sahred.dart';
import '../widgets/custom-bnb.dart';
import '../controllers/category.dart' as categoryContrller;

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // categories.removeAt(0);
    categoryContrller.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categotries List"),
      ),
      body: StreamBuilder(
          stream: categoryStreamController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: userCategories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userCategories[index].name),
                  subtitle: Text(userCategories[index].id.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CategoryPage(
                          category: userCategories[index],
                        ),
                      ),
                    ).then((newCategory) {
                      categoryContrller.updateCategoryData(
                          userCategories[index], newCategory);
                    });
                  },
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Category emptyCategory = Category(
            name: "",
            id: 0,
            userId: user.id,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => CategoryPage(
                category: emptyCategory,
              ),
            ),
          ).then((onValue) {
            if (onValue == "add category") {
              print("enter");
              categoryStreamController.sink.add("event");
            }
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
