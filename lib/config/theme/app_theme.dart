import 'package:flutter/material.dart';

List<Color> _colorThemes = [
  Colors.deepPurple,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor < _colorThemes.length,
        "Selected Color must be in between 0 and ${_colorThemes.length}",
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      typography: Typography(platform: TargetPlatform.iOS),
    );
  }
}
