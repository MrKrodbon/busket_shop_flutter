import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all(const Color.fromRGBO(192, 78, 67, 1)),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
    ),
  );
  static final ButtonStyle radiusBorder = ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
  static const textStyleButton = TextStyle(fontSize: 20, color: Colors.white);
}
