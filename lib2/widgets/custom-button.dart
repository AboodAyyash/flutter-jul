import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color bColor;
  final Color fColor;
  final Function onTap;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.label,
    required this.bColor,
    required this.onTap,
    this.fColor = Colors.white,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(fColor == Colors.white ? 10 : 50),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, color: fColor),
      ),
    );
  }
}