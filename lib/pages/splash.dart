// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterjul/controllers/user.dart';
import 'package:flutterjul/pages/home.dart';
import 'package:flutterjul/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    await getAllUsersFromDB();
    Timer(const Duration(seconds: 1), () {
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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}