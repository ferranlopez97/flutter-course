

import 'package:flutter/material.dart';

class AppTheme {

  final Brightness brightness;

  AppTheme({required this.brightness});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true, 
    brightness: brightness,
    splashColor: Colors.transparent,
    colorSchemeSeed: const Color.fromARGB(255, 67, 116, 240),
  );
}