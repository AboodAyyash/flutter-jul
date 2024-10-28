import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterjul/models/user.dart';

late UserModel user;

var taskStreamController = StreamController.broadcast();
var categoryStreamController = StreamController.broadcast();

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<UserModel> users = [
];


    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';