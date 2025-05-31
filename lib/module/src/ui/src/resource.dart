import 'package:flutter/material.dart';

final class Resource {
  static const MaterialColor colorTransparent = MaterialColor(0x00000000, {});

  static const MaterialColor colorRed = MaterialColor(
    _colorRedValue,
    {
      100: Color(0xFFFFEBEF),
      200: Color(0xFFFFD6DD),
      300: Color(0xFFFF8FA1),
      400: Color(0xFFFF7A90),
      500: Color(_colorRedValue),
      600: Color(0xFFF50028),
      700: Color(0xFFD60021),
      800: Color(0xFF8F0016),
      900: Color(0xFF5C000E),
    },
  );
  static const int _colorRedValue = 0xFFFF5C76;

  static const MaterialColor colorYellow = MaterialColor(
    _colorYellowValue,
    {
      100: Color(0xFFFFFCEB),
      200: Color(0xFFFFF8D6),
      300: Color(0xFFFFEC8F),
      400: Color(0xFFFFE45C),
      500: Color(_colorYellowValue),
      600: Color(0xFFF5CC00),
      700: Color(0xFFC2A200),
      800: Color(0xFFA38800),
      900: Color(0xFF5C4D00),
    },
  );
  static const int _colorYellowValue = 0xFFFFDB29;

  static const MaterialColor colorGreen = MaterialColor(
    _colorGreenValue,
    {
      100: Color(0xFFEEFBEE),
      200: Color(0xFFDDF8DD),
      300: Color(0xFFA3EBA3),
      400: Color(0xFF79E279),
      500: Color(_colorGreenValue),
      600: Color(0xFF2CC92C),
      700: Color(0xFF27B027),
      800: Color(0xFF1A751A),
      900: Color(0xFF114B11),
    },
  );
  static const int _colorGreenValue = 0xFF4FD94F;

  static const MaterialColor colorBlue = MaterialColor(
    _colorBlueValue,
    {
      100: Color(0xFFEBF7FF),
      200: Color(0xFFD6EFFF),
      300: Color(0xFF8FD2FF),
      400: Color(0xFF5CBEFF),
      500: Color(_colorBlueValue),
      600: Color(0xFF0093F5),
      700: Color(0xFF0081D6),
      800: Color(0xFF00568F),
      900: Color(0xFF00375C),
    },
  );
  static const int _colorBlueValue = 0xFF29A9FF;

  static const MaterialColor colorNeutral = MaterialColor(
    _colorNeutralValue,
    {
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEAEBEB),
      300: Color(0xFFC6C8C8),
      400: Color(0xFFABAEB0),
      500: Color(0xFF9B9FA1),
      600: Color(0xFF777B7E),
      700: Color(0xFF5E6164),
      800: Color(_colorNeutralValue),
      900: Color(0xFF2C2E2F),
    },
  );
  static const int _colorNeutralValue = 0xFF454849;

  static const Iterable<MaterialColor> valueColors = [
    Resource.colorBlue,
    Resource.colorBlue,
    Resource.colorBlue,
    Resource.colorBlue,
    Resource.colorNeutral,
    Resource.colorNeutral,
    Resource.colorNeutral,
    Resource.colorNeutral,
    Resource.colorRed,
    Resource.colorRed,
    Resource.colorRed,
  ];
}
