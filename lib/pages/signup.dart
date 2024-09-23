import 'package:flutter/material.dart';
import 'package:flutterjul/pages/profile.dart';
import 'package:flutterjul/widgets/custom-button.dart';
import 'package:flutterjul/widgets/custom-text-feild.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();
  final myFormKey = GlobalKey<FormState>();
  late String username;
  late String userage;

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
                  padding: const EdgeInsets.all(50),
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
                      EnhancedTextFormField(
                          name: "full name", controller: nameCont),
                      const SizedBox(
                        height: 10,
                      ),
                      EnhancedTextFormField(name: "age", controller: ageCont),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            label: "sign-up",
                            bColor: Theme.of(context).primaryColorDark,
                            onTap: () {
                              if (myFormKey.currentState!.validate()) {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ProfilePage(
                                      title: "profile",
                                      name: nameCont.text,
                                      age: ageCont.text,
                                    ),
                                  ),
                                );
                              } else {
                                print("not");
                              }
                            },
                          ),
                          CustomButton(
                              label: "login",
                              bColor: Theme.of(context).primaryColor,
                              onTap: () {
                                Navigator.pop(context);
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
