import 'package:flutter/material.dart';
import '../controllers/user.dart' as userController;
import '../models/user.dart';
import 'profile.dart';
import '../shared/sahred.dart';
import '../widgets/custom-button.dart';
import '../widgets/custom-text-field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

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
          title: Text("Sign Up Page"),
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
                      TextFormFieldWidget(
                          name: "full name", controller: nameCont),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldWidget(name: "age", controller: ageCont),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            label: "Sign Up",
                            bColor: Theme.of(context).primaryColorDark,
                            onTap: () {
                              if (myFormKey.currentState!.validate()) {
                                userController.signup(UserModel(
                                    name: nameCont.text,
                                    age: ageCont.text,
                                    email: emailCont.text,
                                    id: users.length + 1,
                                    password: passwordCont.text));
                          
                                Navigator.pop(context);
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
