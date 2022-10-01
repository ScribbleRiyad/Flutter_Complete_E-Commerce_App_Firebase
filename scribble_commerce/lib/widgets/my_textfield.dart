import 'package:flutter/material.dart';

Widget myTextField(String hintText, keyBoardType, controller) {
  return TextFormField(
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(
        hintText: hintText, focusedBorder: const OutlineInputBorder()),
  );
}
