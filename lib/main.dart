import 'package:flutter/material.dart';
import 'package:flutterjul/pages/splash.dart';
import 'package:flutterjul/shared/sahred.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'website',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade700),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}






/* 

List 
Add
Details
categories
complete todo 
login 
prodfile
signup


category list (name, color)

todo card( title, check, desc, create date, deadline, category)




------------------------



sqlflite
sharedPref
files




pages
widgets
DB
models (User (id, name ,email ,password) , Todo Card(title, check, desc, create date, deadline, category), Category(name, color))
controllers 
shared
services





id   title          desc        isChecked   
1    Go To gym      at 10 AM    1/0
2
3
4
5



name
nema 

color  ==> green
type ==> BMW
doors ==> 4




 */