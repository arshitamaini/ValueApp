import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';

abstract class AppStyle {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      elevation: 2.0,
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF5846A3),
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))));

  static InputDecoration textFieldStyle = InputDecoration(
    hintText: 'Add Here',
    hintStyle: const TextStyle(
      color: Color(0xFFCAC9CC),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFC7C7C8))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFC7C7C8))),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red)),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(color: Color(0xFFC7C7C8))),
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
  );

  static InputDecoration textFieldstyle2 = const InputDecoration(
      hintText: 'Add Here',
      hintStyle: TextStyle(
          color: Color(0xffCAC9CC), fontWeight: FontWeight.w400, fontSize: 14),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white,
      )),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ));

  static TextStyle screenHeadingStyle = const TextStyle(
      color: AppColor.textColor, fontSize: 20.0, fontWeight: FontWeight.w700);
  static TextStyle textFieldLabelStyle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.textColor);
  static TextStyle sideMenuTextStyle = const TextStyle(
      color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 18.0);
  static TextStyle mentalFitnessQuestionStyle = const TextStyle(
      color: AppColor.textColor, fontSize: 14, fontWeight: FontWeight.w500);
}
