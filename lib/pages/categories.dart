import 'package:flutter/material.dart';
import 'package:flutterjul/pages/category.dart';
import 'package:flutterjul/shared/category.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categotries List"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name),
            subtitle: Text(categories[index].id.toString()),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CategoryPage(
                    category: categories[index],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
