// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterjul/DB/user.dart';
import 'package:flutterjul/models/user.dart';
import 'package:flutterjul/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterjul/shared/shared.dart';

String checkLogin(email, password) {
  // String check = '';
  for (var i = 0; i < users.length; i++) {
    if (email == users[i].email) {
      if (password == users[i].password) {
        user = users[i];
        saveUserId();
        return 'Login Success';
      } else {
        return "Check Password";
      }
    } /* else {
      check = "Check Email";
    } */
  }

  return "Check Email";
}

signup(UserModel newUser) {
  UserDatabase userDatabase = UserDatabase.instance;
  userDatabase.create(newUser);
  getAllUsersFromDB();
}

getAllUsersFromDB() async {
  UserDatabase userDatabase = UserDatabase.instance;
  await userDatabase.getAllUsers().then((onValue) {
    users = onValue;
  });
}

saveUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("userId", user.id);
}

logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("userId", 0);
  Navigator.pushReplacement<void, void>(
    navigatorKey.currentState!.context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const SplashPage(),
    ),
  );
}

getUserDataById(id) {
  List usersList = users
      .where((element) => element.id
          .toString()
          .toLowerCase()
          .contains(id.toString().toLowerCase()))
      .toList();
  user = usersList[0];
}