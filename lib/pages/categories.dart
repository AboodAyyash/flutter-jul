import 'package:flutter/material.dart';
import 'package:flutterjul/widgets/custom-bnb.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categotries List"),
      ),
      body: ListView(
        children: [
          //ListTile()
        ],
      ),
      bottomNavigationBar: customBNB(),
    );
  }
}
