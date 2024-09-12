import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String email;
  final String password;
  final String userName;
  const ProfilePage(
      {super.key, required this.email, this.password = '', this.userName = ''});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Email = ${widget.email}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Password = ${widget.password}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Name = ${widget.userName}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
