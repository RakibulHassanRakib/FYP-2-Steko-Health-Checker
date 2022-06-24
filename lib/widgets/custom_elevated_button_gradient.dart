import 'package:flutter/material.dart';

class CustomElevatedButtonGradient extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final double width;
  final double height;
  final Gradient gradient;
  final VoidCallback onPressed;
  final Widget child;

  const CustomElevatedButtonGradient({
    Key key,
    this.onPressed,
    this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [
      Color(0xFF8BBC45),
      Color(0xFF4BB845),
    ]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 20,
        ),
        child: child,
      ),
    );
  }
}
