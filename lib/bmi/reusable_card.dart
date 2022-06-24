import 'package:flutter/material.dart';
import 'package:steko_health_checker/constraints.dart';

class ReusableCard extends StatelessWidget {
  // ignore: non_constant_identifier_names, use_key_in_widget_constructors
  const ReusableCard({@required this.colour, this.card_child});
  final Color colour;
  // ignore: non_constant_identifier_names
  final Widget card_child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: card_child,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: kGreenGradientColor),
    );
  }
}
