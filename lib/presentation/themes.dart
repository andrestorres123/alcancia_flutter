import 'package:flutter/material.dart';

class AlcanciaTheme {
  const AlcanciaTheme._(this.name, this.data);

  final String name;
  final ThemeData data;
}

final AlcanciaTheme kLightAlcanciaTheme =
    AlcanciaTheme._('Light', _buildLightTheme());

ThemeData _buildLightTheme() {
  const Color primaryColor = AlcanciaColors.green;
  final ColorScheme colorScheme =
      const ColorScheme.light().copyWith(primary: primaryColor);
  final ThemeData base = ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      scaffoldBackgroundColor: AlcanciaColors.lightGrey,
      backgroundColor: AlcanciaColors.lightGrey,
      iconTheme: IconThemeData(color: AlcanciaColors.green),
      appBarTheme: AppBarTheme(
          color: AlcanciaColors.grey,
          iconTheme: IconThemeData(color: Colors.white)),
      errorColor: Colors.red,
      buttonTheme: ButtonThemeData(
          colorScheme: colorScheme, textTheme: ButtonTextTheme.primary));
  return base;
}

class AlcanciaColors {
  static const blue = Color(0xFF4CC7F7);
  static const green = Color(0xFF9ACC54);
  static const yellow = Color(0xFFF5A61C);
  static const red = Color(0xFFFF6B6A);
  static const lightBlue = Color(0xFF00C9D3);
  static const lightGrey = Color(0xFFEAEAEA);
  static const grey = Color(0xFF3B3B3B);
  static const darkGrey = Color(0xFF212121);
}
