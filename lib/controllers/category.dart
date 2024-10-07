import 'package:flutter/material.dart';
import 'package:flutterjul/models/category.dart';
import 'package:flutterjul/shared/category.dart';

import 'package:flutterjul/shared/sahred.dart';


void updateCategoryData(Category oldCategory, Category newCategory) {
  int index = categories.indexOf(oldCategory);
  categories.removeAt(index);
  categories.insert(index, newCategory);
  categoryStreamController.sink.add("update Category");
}

void deleteTask(Category task) {
  int index = categories.indexOf(task);
  categories.removeAt(index);

  categoryStreamController.sink.add("update Category");
}
