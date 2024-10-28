import 'package:flutter/material.dart';
import '../DB/category.dart';
import '../models/category.dart';
import '../shared/category.dart';

import '../shared/sahred.dart';

void updateCategoryData(Category oldCategory, Category newCategory) {
  CategoryDatabase categoryDatabase = CategoryDatabase.instance;
  int index = categories.indexOf(oldCategory);
  categories.removeAt(index);
  categories.insert(index, newCategory);
  categoryDatabase.update(newCategory);
  getCategories();
  categoryStreamController.sink.add("update Category");
}

getCategories() async {
  CategoryDatabase categoryDatabase = CategoryDatabase.instance;
  await categoryDatabase.getAllCategories().then((onValue) {
    print("onValue $onValue");
    categories = onValue;
  });
  userCategories = [];
  allCategories = [];
  for (var i = 0; i < categories.length; i++) {
    if (categories[i].userId == user.id) {
      userCategories.add(categories[i]);
      allCategories.add(categories[i]);
    }
  }
  categoryStreamController.sink.add("update Category");
}

addCategory(categoryName) {
  CategoryDatabase categoryDatabase = CategoryDatabase.instance;
  Category category = Category(
    id: DateTime.now().millisecondsSinceEpoch,
    name: categoryName,
    userId: user.id,
  );
  categoryDatabase.create(category);
  getCategories();
  Navigator.pop(navigatorKey.currentState!.context, "add category");
}
