import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final double bordRadious;
  final Color textColor;
  final VoidCallback onPress;

  // ignore: use_key_in_widget_constructors
  const CustomElevatedButton(
      {this.child,
      this.color,
      this.height = 50.0,
      this.bordRadious = 2.0,
      this.textColor,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bordRadious),
          ),
        ),
      ),
    );
  }
}
