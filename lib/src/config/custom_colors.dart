/// *****************************************************************************
///  Copyright © AERO Informática Ltda 2024
///
///  Nome do arquivo: SingInScreen.dart
///  Localização: src/_screen.dart
///
///  Autor: Deimar Jose Marquez ⛬
///  Data: 29/10/2024
/// *****************************************************************************

import 'package:flutter/material.dart';

Map<int, Color> _swatchOpocity = {
  50: const Color.fromARGB(48, 5, 207, 55),
  100: const Color.fromARGB(85, 2, 195, 66),
  200: const Color.fromARGB(92, 96, 195, 3),
  300: const Color.fromARGB(111, 4, 195, 68),
  400: const Color.fromARGB(193, 5, 195, 21),
  500: const Color.fromARGB(138, 6, 195, 79),
  600: const Color.fromARGB(220, 76, 195, 7),
  700: const Color.fromARGB(138, 8, 195, 39),
  800: const Color.fromARGB(255, 9, 195, 9),
  900: const Color.fromARGB(221, 88, 195, 1),
};

abstract class CustomColors {
  static Color Customcontrastcolor = Colors.red.shade900;

  static MaterialColor customSwatchcolor =
      MaterialColor(0xff8b34a, _swatchOpocity);
}
