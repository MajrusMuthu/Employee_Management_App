// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hindText;
  final bool obscureText;
  final TextInputType keyboardType;

  const MyTextField({
    super.key,
    this.controller,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
    required this.hindText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.grey.shade600,
            filled: true,
            hintText: hindText,
            hintStyle: TextStyle(color: Colors.white24)),
      ),
    );
  }
}
