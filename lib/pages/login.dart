import 'package:flutter/material.dart';
import 'package:flutterjul/pages/profile.dart';
import 'package:flutterjul/pages/signup.dart';
import 'package:flutterjul/widgets/custom-button.dart';
import 'package:flutterjul/widgets/custom-text-feild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
                      EnhancedTextFormField(
                          name: "email", controller: emailCont),
                      const SizedBox(
                        height: 10,
                      ),
                      EnhancedTextFormField(
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
                            fColor: Colors.black,
                            fontSize: 20,
                            bColor: Theme.of(context).primaryColorDark,
                            onTap: () {
                              if (myFormKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ProfilePage(
                                      title: "profile",
                                    ),
                                  ),
                                );
                              } else {
                                print("not");
                              }
                            },
                          ),
                          CustomButton(
                              label: "signup",
                              bColor: Theme.of(context).primaryColor,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const SignupPage(title: "signup"),
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
