import 'package:flutter/material.dart';
import 'package:steko_health_checker/constraints.dart';

class BottomBar extends StatelessWidget {
  final String text1;
  final String text2;

  const BottomBar({Key key, this.text1, this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: kGreenGradientColor,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                text1,
                style: kSmallTextGray,
              ),
            ],
          ),
          const SizedBox(
            width: 25.00,
          ),
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: kYelloGradientColor,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                text2,
                style: kSmallTextGray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
