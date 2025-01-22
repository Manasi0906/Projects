import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Customsnackbar {
  static showCustomSnackbar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      backgroundColor: Colors.white,
    ));
  }
}
