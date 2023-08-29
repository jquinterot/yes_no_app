import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(15, 134, 39, 44);
const List<Color> colorThemes = [
  customColor,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.black,
  Colors.deepPurpleAccent,
  Colors.amber,
  Colors.cyan
];

class AppTheme {
  final int selectedColor;
  AppTheme({
    required this.selectedColor,
  }) : assert(selectedColor >= 0 && selectedColor < colorThemes.length - 1,
            'Colors murst be between 0 and ${colorThemes.length} ');
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: (colorThemes[selectedColor]));
  }
}
