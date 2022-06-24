import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../constraints.dart';
import '../custom_elevated_button_gradient.dart';

// ignore: camel_case_types
class Bmp_calculator_section_home_page extends StatelessWidget {
  const Bmp_calculator_section_home_page({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 90.0,
          lineWidth: 8.0,
          percent: 0.0,
          backgroundColor: const Color(0xFF4BB845).withOpacity(0.1),
          progressColor: const Color(0xFF4BB845),
          center: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/heart.svg',
                  height: 32,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '10 BMP',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(
                  'assets/images/Fingerprint.svg',
                  height: 40,
                ),
              ],
            ),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF8BBC45),
                  Color(0xFF4BB845),
                ],
              ),
            ),
          ),
        ),
        CustomElevatedButtonGradient(
          child: const Text(
            'Measure Heart Rate',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
          ),
          onPressed: () {},
          height: 45.0,
          width: double.infinity,
          gradient: kGreenGradientColor,
          borderRadius: BorderRadius.circular(40),
        ),
      ],
    );
  }
}
