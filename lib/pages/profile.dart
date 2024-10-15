import 'package:flutter/material.dart';
import 'package:flutterjul/controllers/user.dart';
import 'package:flutterjul/shared/sahred.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                ListTile(
                  title: Text("Name"),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: Text("Email"),
                  subtitle: Text(user.email),
                ),
                ListTile(
                  title: Text("Password"),
                  subtitle: Text(user.password),
                ),
                ListTile(
                  title: Text("Age"),
                  subtitle: Text(user.age),
                ),
                ListTile(
                  title: Text("ID"),
                  subtitle: Text(user.id.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logout();
        },
        child: Icon(Icons.logout),
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
