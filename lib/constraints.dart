import 'package:flutter/material.dart';

const kGreenGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF8BBC45),
    Color(0xFF4BB845),
  ],
);

const kYelloGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFF1E557),
    Color(0xFFDA982A),
  ],
);

const k30pxPaddingHorizontal = EdgeInsets.symmetric(horizontal: 30.0);
const k30pxPadding = EdgeInsets.all(30.0);

const kSmallTextGray = TextStyle(
  fontSize: 12.0,
  color: Color(0xFF9CA3AF),
);
