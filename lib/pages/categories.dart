// ignore_for_file: avoid_print, prefer_const_constructors, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/pages/category.dart';
import 'package:flutterjul/shared/category.dart';
import 'package:flutterjul/shared/shared.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';
import 'package:flutterjul/controllers/category.dart' as categoryContrller;

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
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