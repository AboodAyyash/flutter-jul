import 'package:flutter/material.dart';
import 'package:flutterjul/pages/categories.dart';
import 'package:flutterjul/pages/completed-tasks.dart';
import 'package:flutterjul/pages/home.dart';
import 'package:flutterjul/pages/profile.dart';
import 'package:flutterjul/shared/sahred.dart';

Widget customBNB() {
  return Container(
    height: 60,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              navigatorKey.currentState!.context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomePage(),
              ),
            );
          },
          icon: Icon(
            Icons.home,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              navigatorKey.currentState!.context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const CategoriesPage(),
              ),
            );
          },
          icon: Icon(
            Icons.list,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              navigatorKey.currentState!.context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const CompletedTasksPage(),
              ),
            );
          },
          icon: Icon(
            Icons.close,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              navigatorKey.currentState!.context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => ProfilePage(),
              ),
            );
          },
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
    ),
  );
}
