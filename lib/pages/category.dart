import 'package:flutter/material.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/shared/category.dart';

class CategoryPage extends StatefulWidget {
  final Category category;
  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Category category;

  TextEditingController nameCon = TextEditingController();
  bool isEditPage = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      category = widget.category;
      nameCon.text = category.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, category);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.id == 0
              ? "Add Category"
              : isEditPage
                  ? "Edit Category"
                  : "Category Details"),
          centerTitle: true,
          actions: [
            if (category.id != 0)
              !isEditPage
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isEditPage = true;
                          nameCon.text = category.name;
                        });
                      },
                      icon: Icon(Icons.edit),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isEditPage = false;
                          category =
                              Category(id: category.id, name: nameCon.text);
                        });
                      },
                      icon: Icon(Icons.save),
                    ),
          ],
        ),
        body: category.id != 0 ? categoryDetailsWidget() : addCategoryWidget(),
      ),
    );
  }

  Widget categoryDetailsWidget() {
    return isEditPage
        ? addCategoryWidget()
        : ListTile(
            title: Text("Name"),
            subtitle: Text(category.name),
          );
  }

  Widget addCategoryWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: nameCon,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
              hintText: "Enter Category Name",
            ),
            onChanged: (value) {
              category.name = value;
            },
          ),
        ),
        if (!isEditPage)
          TextButton(
            onPressed: () {
              category = Category(
                id: DateTime.now().millisecondsSinceEpoch,
                name: nameCon.text,
              );
              categories.add(category);
              Navigator.pop(context, "add category");
            },
            child: Text("Add Category"),
          ),
      ],
    );
  }
}
