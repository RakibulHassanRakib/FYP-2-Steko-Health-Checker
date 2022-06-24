import 'package:flutter/material.dart';
import 'custom_elevated_button.dart';

class LogInButton extends CustomElevatedButton {
  const LogInButton({
    Widget child,
    double bordRadious,
    Color color,
    double height,
    Color textColor,
    VoidCallback onpress,
  }) : super(
          bordRadious: bordRadious,
          child: child,
          color: color,
          textColor: textColor,
          height: height,
          onPress: onpress,
        );
}
