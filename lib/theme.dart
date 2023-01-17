import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData myTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.lora().fontFamily,
        primaryColor: Color.fromARGB(255, 15, 173, 20),
        scaffoldBackgroundColor: Colors.white,
      );
}
