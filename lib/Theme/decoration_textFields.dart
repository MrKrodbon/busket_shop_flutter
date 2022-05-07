import 'package:flutter/material.dart';

abstract class DecorationTextFormFields {

  static final decorationField = InputDecoration(
    
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    icon:Icon(Icons.person), 
  );
  static const textStyle = TextStyle(fontSize: 20, color: Colors.black);
}
