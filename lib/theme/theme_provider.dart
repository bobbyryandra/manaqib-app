import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeOption { system, light, dark }

enum ArabicFontOption {
  amiri,
  scheherazadeNew,
  notoKufiArabic;

  String get label {
    switch (this) {
      case ArabicFontOption.amiri:
        return 'Amiri';
      case ArabicFontOption.scheherazadeNew:
        return 'Scheherazade New';
      case ArabicFontOption.notoKufiArabic:
        return 'Noto Kufi Arabic';
    }
  }

  String get description {
    switch (this) {
      case ArabicFontOption.amiri:
        return 'Klasik, harakat akurat';
      case ArabicFontOption.scheherazadeNew:
        return 'Mirip Mushaf, elegan';
      case ArabicFontOption.notoKufiArabic:
        return 'Gaya Kufi, modern';
    }
  }

  TextStyle textStyle({double? fontSize, Color? color, double? height}) {
    TextStyle baseStyle;
    switch (this) {
      case ArabicFontOption.amiri:
        baseStyle = GoogleFonts.amiri();
      case ArabicFontOption.scheherazadeNew:
        baseStyle = GoogleFonts.scheherazadeNew();
      case ArabicFontOption.notoKufiArabic:
        baseStyle = GoogleFonts.notoKufiArabic();
    }
    return baseStyle.copyWith(
      fontSize: fontSize,
      color: color,
      height: height,
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeModeOption _themeModeOption = ThemeModeOption.system;
  ArabicFontOption _arabicFontOption = ArabicFontOption.amiri;

  ThemeModeOption get themeModeOption => _themeModeOption;
  ArabicFontOption get arabicFontOption => _arabicFontOption;

  ThemeMode get themeMode {
    switch (_themeModeOption) {
      case ThemeModeOption.light:
        return ThemeMode.light;
      case ThemeModeOption.dark:
        return ThemeMode.dark;
      case ThemeModeOption.system:
        return ThemeMode.system;
    }
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme_mode');
    final savedFont = prefs.getString('arabic_font');
    if (savedTheme != null) {
      _themeModeOption = ThemeModeOption.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeModeOption.system,
      );
    }
    if (savedFont != null) {
      _arabicFontOption = ArabicFontOption.values.firstWhere(
        (e) => e.name == savedFont,
        orElse: () => ArabicFontOption.amiri,
      );
    }
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeModeOption mode) async {
    _themeModeOption = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', mode.name);
    notifyListeners();
  }

  Future<void> setArabicFont(ArabicFontOption font) async {
    _arabicFontOption = font;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('arabic_font', font.name);
    notifyListeners();
  }
}
