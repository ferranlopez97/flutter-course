

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // final primaryColor = 0xFF006D3F;
  final primaryColor = 0xFF00FF99;


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Color(primaryColor), 
    textTheme: GoogleFonts.robotoTextTheme(),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {TargetPlatform.android : CupertinoPageTransitionsBuilder()})
  );

}