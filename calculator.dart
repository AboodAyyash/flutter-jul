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
  void _changeText(String newString) {
    setState(() {
      if (newString == "" && currentText.isNotEmpty) {
        currentText = currentText.substring(0, currentText.length - 1);
      } else {
        currentText = currentText + newString;
      }
    });
  }

  void reset() {
    num1 = "";
    num2 = "";
    op = "";
    result = 0;
    setState(() {});
  }

  TextEditingController mycontroller = TextEditingController();

  void addValue(String value) {
    if (int.tryParse(value) != null) {
      if (op == "") {
        num1 += value;
      } else {
        num2 += value;
      }
    } else if (value == '=') {
      calculate();
      setState(() {
        currentText = result.toString();
      });
      op = '=';
    } else if (value != "") {
      op = value;
    } else {
      if (op == '=') {
        op = "";
        num1 = num1.substring(0, num1.length - 1);
        num2 = num2.substring(0, num2.length - 1);
      } else if (num2.isNotEmpty) {
        num2 = "";
      } else if (op.isNotEmpty) {
        op = "";
      } else {
        num1 = "";
      }
    }
    setState(() {});
  }

  double calculate() {
    if (op == '+') {
      result = double.parse(num1) + double.parse(num2);
    } else if (op == '-') {
      result = double.parse(num1) - double.parse(num2);
    } else if (op == '*') {
      result = double.parse(num1) * double.parse(num2);
    } else {
      result = double.parse(num1) / double.parse(num2);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Spacer(flex: 1),
            TextField(
              controller: mycontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter an equation'),
            ),
            const Spacer(flex: 1),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange.shade50,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 242, 148, 119),
                            strokeAlign: 5,
                            width: 2))),
                onPressed: () {
                  List<String> tokens =
                      mycontroller.text.split(RegExp(r'(\+|\-|\*|\/|\=)'));
                  List<String> operators = RegExp(r'(\+|\-|\*|\/|\=)')
                      .allMatches(mycontroller.text)
                      .map((e) => e.group(0)!)
                      .toList();
                  List<double> numbers =
                      tokens.map((e) => double.parse(e)).toList();

                  for (var i = 0; i < numbers.length; i++) {
                    addValue(numbers[i].toString());
                    if (i != numbers.length - 1)
                      addValue(operators[i].toString());
                    else
                      addValue("=");
                  }
                  print(operators);

                  setState(() {
                    mycontroller.text = result.toString();
                  });
                  reset();
                },
                child: const Text(
                  "calculate for text field",
                  style: TextStyle(fontSize: 20),
                )),
            const Spacer(flex: 1),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 189, 167),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  currentText,
                  style: Theme.of(context).textTheme.headlineMedium,
                )),

            // Text("num1 = $num1 num2= $num2 op= $op result= $result")
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 450,
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 227, 189, 167),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Wrap(
              spacing: 5,
              runSpacing: 10,
              // crossAxisCount: 5,
              // crossAxisSpacing: 6,
              // mainAxisSpacing: 5,
              children: [
                button("-", "-"),
                button("+", "+"),
                button("/", "/"),
                button("*", "*"),
                button("=", "="),
                button("", "Back"),
                button("1", "1"),
                button("2", "2"),
                button("3", "3"),
                button("4", "4"),
                button("5", "5"),
                button("6", "6"),
                button("7", "7"),
                button("8", "8"),
                button("9", "9"),
              ]),
        ),
      ),
    );
  }

  Widget button(title, tooltip) {
    return FloatingActionButton.large(
      onPressed: () {
        _changeText(title);
        addValue(title);
      },
      tooltip: tooltip,
      child: title == ''
          ? Icon(Icons.highlight_remove_outlined)
          : Text(
              title,
              style: TextStyle(fontSize: 30),
            ),
    );
  }

  String num1 = "";
  String num2 = "";
  String op = "";
  double result = 0.0;
  String currentText = "";
}
