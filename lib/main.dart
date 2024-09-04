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
  TextEditingController conName = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  TextEditingController conPhone = TextEditingController();

  List numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
    1,
    2,
    3,
    4,
    5,
    6,
    1,
    2,
    3,
    4,
    5,
    6,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
  ];
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
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            /* image: DecorationImage(
              image: NetworkImage(
                "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
              ),
              fit: BoxFit.cover), */
            ),
        child: ListView(
          children: [
            /*  for (int i = 0; i < numbers.length; i++)
              Text(numbers[i].toString()),
            for (var number in numbers) Text(number.toString()), */
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [customText(numbers[index].toString())],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: conName,
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 50),
                  hintStyle: TextStyle(fontSize: 30),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            customText("Hello 21"),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: conPassword,
                decoration: const InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 50),
                  hintStyle: TextStyle(fontSize: 30),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: conPhone,
                decoration: const InputDecoration(
                  hintText: "Enter Your Phone Number",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontSize: 50),
                  hintStyle: TextStyle(fontSize: 30),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  print(value);
                  //call api
                },
                onSubmitted: (value) {
                  print("onSubmitted");
                },
                onTap: () {
                  print("Tapped");
                },
              ),
            ),
            TextButton(
              onPressed: () {
                print(conName.text.toString());
                print(conPassword.text.toString());
                print(conPhone.text.toString());

                if (conName.text.toString().isEmpty ||
                    conPassword.text.toString().isEmpty) {
                  print("Fill Name And Pasword");
                } else {
                  print("Loggedin");
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                conName.text = "Ali";
                conPassword.text = "123456";
                conPhone.text = "078";
              },
              child: Text("FillData"),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            /* CircleAvatar(
              backgroundImage: NetworkImage(
                "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
              ),
              radius: 50,
            ) */
            /*  Image.network(
              "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
              width: 200,
              height: 400,
              fit: BoxFit.cover,
            ) */
            /* Image.asset(
             "assets/images/images.jpeg",
              width: 200,
              height: 400,
              fit: BoxFit.cover,
            )  */

            Row(
              children: [
                InkWell(
                  child: TextButton(
                    child: Text("1"),
                    onPressed: () {
                      addValue(1);
                    },
                  ),
                ),
                InkWell(
                  child: TextButton(
                    child: Text("2"),
                    onPressed: () {
                      addValue(2);
                    },
                  ),
                ),
                InkWell(
                  child: TextButton(
                    child: Text("3"),
                    onPressed: () {
                      addValue(3);
                    },
                  ),
                ),
                InkWell(
                  child: TextButton(
                    child: Text("="),
                    onPressed: () {
                      addValue("=");
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  child: TextButton(
                    child: Text("+"),
                    onPressed: () {
                      addValue("+");
                    },
                  ),
                ),
                InkWell(
                  child: TextButton(
                    child: Text("-"),
                    onPressed: () {
                      addValue("-");
                    },
                  ),
                ),
                InkWell(
                  child: TextButton(
                    child: Text("*"),
                    onPressed: () {
                      addValue("*");
                    },
                  ),
                ),
                InkWell(
                  child: TextButton(
                    child: Text("/"),
                    onPressed: () {
                      addValue("/");
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                  "Num 1 = $num1    ,    Num 2 = $num2    ,   OP = $op    ,    result = $result"),
            ),
            Image.asset(
              "assets/images/images.jpeg",
              width: 200,
              height: 400,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/images.jpeg",
              width: 200,
              height: 400,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  addValue(value) {
    if (value.runtimeType == int) {
      if (op != "") {
        num2 += value.toString();
      } else {
        num1 += value.toString();
      }
    } else {
      if (value != "=")
        op = value;
      else
        calculate();
    }
    setState(() {});
  }

  calculate() {
    if (op == '+') {
      result = convertToDouyble(num1) + convertToDouyble(num2);
    } else if (op == '-') {
      result = convertToDouyble(num1) - convertToDouyble(num2);
    } else if (op == '*') {
      result = convertToDouyble(num1) * convertToDouyble(num2);
    } else {
      result = convertToDouyble(num1) / convertToDouyble(num2);
    }
    setState(() {});
    return result;
  }

  double convertToDouyble(value) {
    return double.parse(value.toString());
  }

  String num1 = "";
  String num2 = "";
  String op = "";
  double result = 0;

  Widget customText(value) {
    return Container(
      child: Text("$value"),
    );
  }
}
