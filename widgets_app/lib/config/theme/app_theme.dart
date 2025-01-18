
import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.blue,
  Colors.teal,
  Colors.green, 
  Colors.red, 
  Colors.purple, 
  Colors.deepPurple, 
  Colors.pink,
  Colors.pinkAccent
  ];


class AppTheme {

  final bool isDarkMode;
  final int selectedColor; 

  AppTheme({
    this.isDarkMode = false, 
    this.selectedColor = 0
  }) : assert(selectedColor >= 0, "Selected color has to be > 0"), 
     assert(selectedColor < colors.length, "Selected color must be equal or less than ${colors.length -1}");

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colors[selectedColor], 
    appBarTheme: const AppBarTheme(centerTitle: false)
  );

  AppTheme copyWith({
    int? selectedColor, 
    bool? isDarkMode
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}  