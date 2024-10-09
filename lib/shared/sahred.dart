import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterjul/models/user.dart';

late UserModel user;

var taskStreamController = StreamController.broadcast();
var categoryStreamController = StreamController.broadcast();

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<UserModel> users = [
  UserModel(
      name: "Ahmad",
      age: "25",
      email: "ahmad@gmail.com",
      id: 1,
      password: "qwerAsdf@1234"),
  UserModel(
      name: "Emad",
      age: "20",
      email: "emad@gmail.com",
      id: 2,
      password: "qwerAsdf@1234"),
  UserModel(
      name: "Omar",
      age: "22",
      email: "omar@gmail.com",
      id: 3,
      password: "qwerAsdf@1234"),
  UserModel(
      name: "Aya",
      age: "28",
      email: "aya@gmail.com",
      id: 4,
      password: "qwerAsdf@1234"),
];
