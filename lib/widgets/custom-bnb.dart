// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterjul/pages/categories.dart';
import 'package:flutterjul/pages/completed-tasks.dart';
import 'package:flutterjul/pages/home.dart';
import 'package:flutterjul/pages/profile.dart';
import 'package:flutterjul/shared/shared.dart';

Widget customBNB() {
  return Container(
    height: 60,
    color: const Color(0xFFD3B187),
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
          icon: const Icon(
            Icons.home,
            color: Colors.black,
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
          icon: const Icon(
            Icons.list,
          ),
          color: Colors.black,
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
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              navigatorKey.currentState!.context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProfilePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}