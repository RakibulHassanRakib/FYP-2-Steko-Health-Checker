import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const Health({
    Key key,
    this.title,
    this.obscureText,
    this.textInputType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: title,
          labelStyle: const TextStyle(
            color: Color(0xFFADA4A5),
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
