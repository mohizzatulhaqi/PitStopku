import 'package:flutter/material.dart';

const int _customRedPrimaryValue = 0xFFdf140d;

const Map<int, Color> _redSwatch = {
  50: Color(0xFFfce9e8),
  100: Color(0xFFf8c8c6),
  200: Color(0xFFf3a4a0),
  300: Color(0xFFee7f79),
  400: Color(0xFFea625d),
  500: Color(_customRedPrimaryValue),
  600: Color(0xFFc91208),
  700: Color(0xFFb21007),
  800: Color(0xFF9c0d06),
  900: Color(0xFF800a05),
};

const MaterialColor customRed = MaterialColor(
  _customRedPrimaryValue,
  _redSwatch,
);
