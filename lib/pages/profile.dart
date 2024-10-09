import 'package:flutter/material.dart';
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
        elevation: 100,
        centerTitle: true,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 50),
              child: Icon(
                Icons.account_circle,
              )),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [],
            ),
          ),
        ),
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
