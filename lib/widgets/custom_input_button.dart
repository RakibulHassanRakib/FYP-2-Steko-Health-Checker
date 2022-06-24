import 'package:flutter/material.dart';

class CustomInputButton extends StatelessWidget {
  final String title;
  final Widget prefixIconUrl;
  final Widget suffixIconUrl;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const CustomInputButton({
    Key key,
    this.title,
    this.prefixIconUrl,
    this.suffixIconUrl,
    this.obscureText,
    this.textInputType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        prefixIcon: prefixIconUrl,
        suffixIcon: suffixIconUrl,
      ),
    );
  }
}
