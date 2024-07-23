import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Estilos {
  static Estilos? _instance;
  // Avoid self instance
  Estilos._();
  static Estilos get instance {
    _instance ??= Estilos._();
    return _instance!;
  }

  TextStyle get titulo {
    return GoogleFonts.lato(
      fontStyle: FontStyle.normal,
      fontSize: 40,
      color: const Color.fromARGB(255, 145, 18, 9),
    );
  }

  TextStyle get textoPadrao {
    return GoogleFonts.lato(
      fontStyle: FontStyle.normal,
      fontSize: 20,
      color: const Color.fromARGB(255, 252, 250, 250),
    );
  }
}
