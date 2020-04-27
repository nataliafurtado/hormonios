import 'package:flutter/material.dart';

class Styles {
  static TextStyle get ttt => TextStyle(
      color: const Color(0XFF334856),
      fontFamily: 'Europa',
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static TextStyle get texto01 => TextStyle(
        color: Colors.white,
        fontFamily: 'Europa',
      );

  static Color get azulTrans => const Color(0xff73d5ea);
  static Color get rosaTrans => const Color(0xffffb5cb);
}

const MaterialColor blueTrans = const MaterialColor(
  0xff73d5ea,
  const <int, Color>{
    50: const Color(0xFFe9f8fc),
    100: const Color(0xFFd3f1f8),
    200: const Color(0xFFbcebf5),
    300: const Color(0xFFa6e4f2),
    400: const Color(0xFF90ddee),
    500: const Color(0xFF7ad6eb),
    600: const Color(0xFF64d0e8),
    700: const Color(0xFF4ec9e4),
    800: const Color(0xFF37c2e1),
    900: const Color(0xFF21bbde),
  },
);

const MaterialColor pinkTrans = const MaterialColor(
  0xffffb5cb,
  const <int, Color>{
    50: const Color(0xFFffe6ed),
    100: const Color(0xFFffccdb),
    200: const Color(0xFFff99b8),
    300: const Color(0xFFffafc7),
    400: const Color(0xFFff6694),
    500: const Color(0xFFff4d82),
    600: const Color(0xFFff80a6),
    700: const Color(0xFFff99b8),
    800: const Color(0xFFffb3c9),
    900: const Color(0xFFff3370),
  },
);
