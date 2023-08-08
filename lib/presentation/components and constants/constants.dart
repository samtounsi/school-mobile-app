import 'package:flutter/material.dart';

class AppColors {
  static const darkBlue = Color(0xFF295087);
  static const aqua = Color(0xFFA6CDCA);
  static const lightOrange = Color(0xFFF0B976);
  static const borderColor = Color(0xFFF0EDED);
  static const shadow = Color(0xF295087);
  static Color blue = Color.fromARGB(255, 34, 88, 164);
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

String? token;
int? id;
int? profileId;
String? type;

int daysBetween(DateTime? from, DateTime? to) {
  from = DateTime(from!.year, from.month, from.day);
  to = DateTime(to!.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
