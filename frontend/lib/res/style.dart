import 'package:flutter/material.dart';

abstract class AppStyle {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      elevation: 10.0,
      foregroundColor: const Color(0xFFD9AB68),
      backgroundColor: Colors.black,
      textStyle: const TextStyle(color: Color(0xFFD9AB68), fontSize: 20.0),
      shadowColor: const Color(0xFFD9AB68),
      side: const BorderSide(color: Color(0xFFD9AB68), width: 2.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))));

  static InputDecoration textFieldStyle(String fieldName) {
    return InputDecoration(
        labelText: fieldName,
        hintText: fieldName,
        labelStyle: const TextStyle(color: Color(0xFFD9AB68)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        contentPadding: const EdgeInsets.only(left: 15.0),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Color(0xFFD9AB68), width: 2.0),
        ));
  }

  static TextStyle screenHeadingStyle = const TextStyle(
      color: Color(0xFFD9AB68), fontSize: 35.0, fontWeight: FontWeight.w700);
  static TextStyle homeDrawerStyle = const TextStyle(
      color: Color(0xFFD9D9D9), fontWeight: FontWeight.w500, fontSize: 20.0);
}
