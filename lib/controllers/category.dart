import 'package:flutter/material.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/shared/category.dart';

import 'package:flutterjul/shared/sahred.dart';

void updateCategoryData(Category oldCategory, Category newCategory) {
  int index = categories.indexOf(oldCategory);
  categories.removeAt(index);
  categories.insert(index, newCategory);
  getCategories();
  categoryStreamController.sink.add("update Category");
}

getCategories() {
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
