import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Jul',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage();
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text(
          "Title",
          style: TextStyle(
            fontSize: 40.0,
            color: Color.fromARGB(255, 203, 13, 13).withOpacity(0.5),
          ),
        ),
        actions: [
          InkWell(
            onDoubleTap: () => print("Double"),
            onTap: () {
              print("Tap");
            },
            child: Text("Action 1"),
          ),
          Icon(Icons.settings),
          IconButton(
            onPressed: () {
              //Dart Code
              print("Hello");
            },
            icon: Icon(Icons.wifi),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.red,
        width: 200,
      ),
    );
  }
}
