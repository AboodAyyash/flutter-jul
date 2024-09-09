import 'dart:math';

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
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My First calculator in flutter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sizes = 20;
  Color bgColor = Colors.red;
  double height = 100;
  double x = 50;
  double y = 50;
  Color z = Colors.blue;

  double _containerWidth = 100;
  double _containerHeight = 100;

  void _increaseWidth() {
    setState(() {
      _containerWidth += 20;
    });
  }

  void _decreaseWidth() {
    setState(() {
      _containerWidth =
          (_containerWidth > 20) ? _containerWidth - 20 : _containerWidth;
    });
  }

  void _increaseHeight() {
    setState(() {
      _containerHeight += 20;
    });
  }

  void _decreaseHeight() {
    setState(() {
      _containerHeight =
          (_containerHeight > 20) ? _containerHeight - 20 : _containerHeight;
    });
  }

  double _width = 100.0;
  double _height = 100.0;
  double _containerSize = 100;
  Color _containerColor = Colors.grey;

  void _increaseSize() {
    setState(() {
      _containerSize += 10;
    });
  }

  void _decreaseSize() {
    setState(() {
      if (_containerSize > 20) {
        _containerSize -= 10;
      }
    });
  }

  void _changeColor(Color color) {
    setState(() {
      _containerColor = color;
    });
  }

  int value = 0;
  void operation(String op) {
    setState(() {
      if (op == "+")
        value += 1;
      else if (op == "-") value -= 1;
    });
  }

  int _counter = 0;
  TextEditingController conN1 = TextEditingController();
  TextEditingController conN2 = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conAll = TextEditingController();

  String allValues = "";
  String value1 = "";
  String value2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: ListView(
              children: [
                Center(
                  child: Container(
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Image.network(
                                    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                Image.network(
                                    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(nameController.text);
                          print(passwordController.text);

                          if (nameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            print("Fill Name and Password");
                          } else {
                            print("Logged in");
                          }
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 90, // Set the desired width
                          height: 100, // Set the desired height (optional)
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 71, 62, 62),
                                  fontWeight:
                                      FontWeight.bold, // Makes the text bold
                                  fontSize: 20.0,
                                ),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          width: 90, // Set the desired width
                          height: 100, // Set the desired height (optional)
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Age",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 71, 62, 62),
                                  fontWeight:
                                      FontWeight.bold, // Makes the text bold
                                  fontSize: 20.0,
                                ),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          width: 90, // Set the desired width
                          height: 100, // Set the desired height (optional)
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Major",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 71, 62, 62),
                                  fontWeight:
                                      FontWeight.bold, // Makes the text bold
                                  fontSize: 20.0,
                                ),
                                border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
                        Image.network(
                            "https://t4.ftcdn.net/jpg/04/17/28/93/360_F_417289346_hrs0D4Lo8dSv3aWDqkQpRB0U9PbtFX6n.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover),
                        Text("Done",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Makes the text bold
                              fontSize: 20.0,
                            ))
                      ],
                    )
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextField(
                          controller: conN1,
                          decoration: const InputDecoration(
                            hintText: "Enter the first value",
                            labelText: "value 1",
                            labelStyle: TextStyle(fontSize: 50),
                            hintStyle: TextStyle(fontSize: 30),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            allValues += conN1.text.substring(
                                conN1.text.length - 1, conN1.text.length);

                            setState(() {});
                          },
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextField(
                          controller: conN2,
                          decoration: const InputDecoration(
                            hintText: "Enter the second value",
                            labelText: "value 2",
                            labelStyle: TextStyle(fontSize: 50),
                            hintStyle: TextStyle(fontSize: 30),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            allValues += conN2.text.substring(
                                conN2.text.length - 1, conN2.text.length);
                            setState(() {});
                          },
                        ),
                      ),

                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Text("$allValues"),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                operation("+");
                              },
                              icon: Icon(Icons.add),
                            ),
                            Container(
                              child: Text("$value"),
                            ),
                            IconButton(
                              onPressed: () {
                                operation("-");
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _containerSize,
                        height: _containerSize,
                        color: _containerColor,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: _increaseSize,
                            iconSize: 30,
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: _decreaseSize,
                            iconSize: 30,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => _changeColor(Colors.red),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Text('Red'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => _changeColor(Colors.green),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: Text('Green'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => _changeColor(Colors.blue),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: Text('Blue'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Column(children: [
                        TextButton(
                            onPressed: () {
                              x += 10;
                              y += 10;
                              setState(() {});
                            },
                            child: Text("+Size")),
                        TextButton(
                            onPressed: () {
                              if (x != 0 && y != 0) {
                                x -= 10;
                                y -= 10;
                              }
                              setState(() {});
                            },
                            child: Text("-Size")),
                      ]),
                      Container(
                        width: x,
                        height: y,
                        color: z,
                      ),
                      Column(children: [
                        TextButton(
                            onPressed: () {
                              z = Colors.red;
                              setState(() {});
                            },
                            child: Text("Red")),
                        TextButton(
                            onPressed: () {
                              z = Colors.blue;
                              setState(() {});
                            },
                            child: Text("Blue")),
                        TextButton(
                            onPressed: () {
                              z = Colors.greenAccent;
                              setState(() {});
                            },
                            child: Text("Green")),
                      ]),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _width,
                        height: _height,
                        color: Colors.blue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _width += 20.0;
                                });
                              },
                              child: Text("Increase Width")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _height += 20.0;
                                });
                              },
                              child: Text("Increase Height")),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: height,
                  alignment: Alignment.center,
                  color: bgColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  bgColor = Colors.red;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("Red")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  bgColor = Colors.green;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("Green")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  bgColor = Colors.blue;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("Blue")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  bgColor = Colors.yellow;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("Yellow")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  height = 100;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("height 100")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  height = 300;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("height 300")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  height = 600;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("height 600")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  height = 900;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text("height 900"))
                        ],
                      )
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // The container whose size will change
                      AnimatedContainer(
                        width: _containerWidth,
                        height: _containerHeight,
                        color: _containerColor,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      ),
                      const SizedBox(height: 30),

                      // Buttons to increase and decrease width
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _increaseWidth,
                            child: const Text('Increase Width'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _decreaseWidth,
                            child: const Text('Decrease Width'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Buttons to increase and decrease height
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _increaseHeight,
                            child: const Text('Increase Height'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _decreaseHeight,
                            child: const Text('Decrease Height'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("this is the text"),
                    TextButton(onPressed: () {}, child: Text("BTN1")),
                    TextButton(onPressed: () {}, child: Text("BTN2")),
                    Image(
                        image: NetworkImage(
                            'data:image/png;base64,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'),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      for (int i = 0; i < 6; i++)
                        Container(
                          width: sizes * (i + 1),
                          height: sizes * (i + 1),
                          color: Colors.blueAccent,
                          child: Image.network(
                            'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                    ], /*  List.generate(6, (index) {
                      return Container(
                        width: sizes[index],
                        height: sizes[index],
                        color: Colors.blueAccent,
                        child: Image.network(
                          'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp',
                          fit: BoxFit.cover,
                        ),
                      );
                    }), */
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
