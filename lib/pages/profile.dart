import 'package:flutter/material.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Page",
           style: TextStyle(
           fontFamily: 'Roboto',
           fontWeight: FontWeight.bold,
           color: Colors.black,
           fontSize: 30.0,
          ),),
        elevation: 100,
        centerTitle: true,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 50),
              child: Icon(
                Icons.account_circle,
              )),
        ],
        backgroundColor: const Color(0xFFD3B187),
      ),
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: const [],
            ),
          ),
        ),
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}