import 'package:flutter/material.dart';
import '../shared/sahred.dart';

Future showCustomDialog({title, body, okButtonText, cancelButtonText}) async {
  return showDialog(
    context: navigatorKey.currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          if (cancelButtonText != null)
            TextButton(
              child: Text(cancelButtonText),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          TextButton(
            child: Text(okButtonText),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}
