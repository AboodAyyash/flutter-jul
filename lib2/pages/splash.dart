import 'dart:async';

import 'package:flutter/material.dart';
import '../DB/user.dart';
import '../controllers/user.dart';
import 'home.dart';
import 'login.dart';
import '../shared/sahred.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  void start() async {
    await getAllUsersFromDB();
    Timer(Duration(seconds: 1), () {
      checkUser();
    });
  }

  checkUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("userId") != null && prefs.getInt("userId") != 0) {
      getUserDataById(prefs.getInt("userId"));
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    } else {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
