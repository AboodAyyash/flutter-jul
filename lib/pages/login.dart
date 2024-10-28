import 'package:flutter/material.dart';

import 'package:flutterjul/pages/home.dart';

import 'package:flutterjul/pages/signup.dart';

import 'package:flutterjul/widgets/custom-button.dart';
import 'package:flutterjul/widgets/custom-text-field.dart';
// ignore: library_prefixes
import 'package:flutterjul/controllers/user.dart' as userController;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  final myFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          titleTextStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          color: Colors.black,
         fontSize: 30.0,
        ),
        backgroundColor: const Color(0xFFD3B187),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 252, 244)),
            child: Form(
                key: myFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormFieldWidget(name: "email", controller: emailCont),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldWidget(
                        name: "password",
                        controller: passwordCont,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            label: "login",
                            bColor: Theme.of(context).primaryColor,
                            onTap: () {
                              if (myFormKey.currentState!.validate()) {
                                String result = userController.checkLogin(
                                    emailCont.text, passwordCont.text);
                                // ignore: avoid_print
                                print(result);
                                if (result == "Login Success") {
                                  Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const HomePage(),
                                    ),
                                  );
                                }
                              } else {
                                // ignore: avoid_print
                                print("not");
                              }
                            },
                          ),
                          CustomButton(
                              label: "signup",
                              bColor: Theme.of(context).primaryColorDark,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const SignupPage(),
                                  ),
                                );
                              })
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}