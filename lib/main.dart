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

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 20;

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      print("B $counter ");
                      counter += 1;
                      print("A $counter ");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      print("B $counter ");
                      counter += 1;
                      print("A $counter ");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      print("B $counter ");
                      counter += 1;
                      print("A $counter ");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                )
              ],
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      print("B $counter ");
                      counter += 1;
                      print("A $counter ");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("B $counter ");
                      counter += 1;
                      print("A $counter ");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("B $counter ");
                      counter += 1;
                      print("A $counter ");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                ],
            )
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
