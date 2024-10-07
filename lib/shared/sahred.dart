import 'dart:async';

import 'package:flutter/material.dart';

Map user = {};

var taskStreamController = StreamController.broadcast();
var categoryStreamController = StreamController.broadcast();

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
