import 'package:flutter/material.dart';

InputDecoration customTextFieldDecoration({String hintText = "Title", Color bColor = Colors.black}) {
  return
    InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: bColor,
    contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.5),
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white60,
        width: 2.0, // Thicker border when focused
      ),
    ),
  );

}