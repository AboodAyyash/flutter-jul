import 'package:flutter/material.dart';
import 'package:flutterjul/main.dart';
import 'package:flutterjul/profile.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCon = TextEditingController();
  TextEditingController nameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Signup"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailCon,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameCon,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordCon,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      bool hasChar = false;
                      bool hasNum = false;
                      for (var i = 0; i < value!.length; i++) {
                        if (int.tryParse(value[i]) != null) {
                          hasNum = true;
                        } else {
                          hasChar = true;
                        }
                      }

                      if (value.isEmpty) {
                        return 'Please enter your password';
                      } else if (hasChar && hasNum && value.length > 8) {
                        return null;
                      } else {
                        return 'Please enter a valid password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Done!");
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => ProfilePage(
                                  email: emailCon.text.toString(),
                                  password: passwordCon.text.toString(),
                                  userName: nameCon.text.toString(),
                                ),
                              ),
                            );
                          } else {
                            print("Not Done!");
                          }
                        },
                        child: Text("Signup"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          /* Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => MyHomePage(
                                title: 'Login',
                              ),
                            ),
                          ); */
                          Navigator.pop(context);
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isValidEmail(String email) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }

  bool isValidPassword(String password) {
//special Char
//UpperCase Char
// minimum 8 chars
// at least one number
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }
}
