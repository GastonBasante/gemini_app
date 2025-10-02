import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF378B6F);

enum ColorType { custom, amber, blue, purple, orange, green, red, pink }

enum ModoType { dark, light }

const Map<ModoType, Brightness> _modoMap = {
  ModoType.dark: Brightness.dark,
  ModoType.light: Brightness.light,
};

const Map<ColorType, Color> _mapColor = {
  ColorType.custom: _customColor,
  ColorType.amber: Colors.amber,
  ColorType.blue: Colors.blue,
  ColorType.orange: Colors.deepOrangeAccent,
  ColorType.purple: Colors.deepPurple,
  ColorType.green: Colors.lightGreen,
  ColorType.red: Colors.redAccent,
  ColorType.pink: Colors.pink,
};

extension ColorTypeX on ColorType {
  Color get value => _mapColor[this]!;
}

class AppTheme {
  final ColorType colorSelect;
  final ModoType modo;

  AppTheme({this.colorSelect = ColorType.custom, this.modo = ModoType.light});

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorSelect.value,
      brightness: _modoMap[modo],
      appBarTheme: AppBarTheme(centerTitle: false, elevation: 100),
    );
  }
}
