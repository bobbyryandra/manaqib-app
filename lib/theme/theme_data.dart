import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Color tokens inspired by SalahMate Islamic app design
/// Deep emerald green + gold accents + sky blue highlights
class AppColors {
  // Primary palette
  static const primary = Color(0xFF0D4B3F);
  static const primaryLight = Color(0xFF1A6B5A);
  static const primaryDark = Color(0xFF083329);

  // Accent colors
  static const gold = Color(0xFFD4A843);
  static const goldLight = Color(0xFFE8C96A);
  static const skyBlue = Color(0xFF5BA4CF);

  // Light theme
  static const lightBackground = Color(0xFFF8F9FA);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceVariant = Color(0xFFF0F4F3);
  static const lightTextPrimary = Color(0xFF1A1A2E);
  static const lightTextSecondary = Color(0xFF5C6670);

  // Dark theme
  static const darkBackground = Color(0xFF0F1923);
  static const darkSurface = Color(0xFF1A2634);
  static const darkSurfaceVariant = Color(0xFF253341);
  static const darkTextPrimary = Color(0xFFE8ECF0);
  static const darkTextSecondary = Color(0xFF9BA5B0);
}

/// Font configuration: Playfair Display (serif) for headings, Inter for body
class AppFonts {
  // Serif — headings, titles, section names
  static final headingMedium = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );

  static final headingLarge = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w700,
    fontSize: 22,
  );

  static final headingSmall = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  // Body — descriptions, labels, general text
  static final body = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static final bodySmall = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static final bodyBold = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    final textTheme = _buildTextTheme(brightness: Brightness.light);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: textTheme,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryLight,
        secondary: AppColors.gold,
        onSecondary: AppColors.primaryDark,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightTextPrimary,
        surfaceContainerHighest: AppColors.lightSurfaceVariant,
        outline: AppColors.primary.withValues(alpha: 0.12),
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardTheme: const CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        color: AppColors.lightSurface,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.lightTextSecondary,
        backgroundColor: AppColors.lightSurface,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.lightTextSecondary.withValues(alpha: 0.6),
          fontSize: 14,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.lightTextPrimary,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final textTheme = _buildTextTheme(brightness: Brightness.dark);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: textTheme,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.goldLight,
        onSecondary: AppColors.primaryDark,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,
        surfaceContainerHighest: AppColors.darkSurfaceVariant,
        outline: AppColors.gold.withValues(alpha: 0.12),
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardTheme: const CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        color: AppColors.darkSurface,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkTextPrimary,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.darkTextPrimary,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.darkTextSecondary,
        backgroundColor: AppColors.darkSurface,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.darkTextSecondary.withValues(alpha: 0.6),
          fontSize: 14,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.darkTextPrimary,
        ),
      ),
    );
  }

  /// Build consistent text theme with serif headings + sans-serif body
  static TextTheme _buildTextTheme({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;
    final primaryText = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryText = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    // Serif headings — Playfair Display
    final displayLarge = GoogleFonts.playfairDisplay(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.2,
    );
    final displayMedium = GoogleFonts.playfairDisplay(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.2,
    );
    final displaySmall = GoogleFonts.playfairDisplay(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.3,
    );
    final headlineLarge = GoogleFonts.playfairDisplay(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.3,
    );
    final headlineMedium = GoogleFonts.playfairDisplay(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.3,
    );
    final headlineSmall = GoogleFonts.playfairDisplay(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.3,
    );

    // Semi-serif titles — Playfair Display lighter
    final titleLarge = GoogleFonts.playfairDisplay(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.3,
    );
    final titleMedium = GoogleFonts.playfairDisplay(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: primaryText,
      height: 1.4,
    );
    final titleSmall = GoogleFonts.playfairDisplay(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: primaryText,
      height: 1.4,
    );

    // Sans-serif body — Inter
    final bodyLarge = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: primaryText,
      height: 1.5,
    );
    final bodyMedium = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: primaryText,
      height: 1.5,
    );
    final bodySmall = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: secondaryText,
      height: 1.5,
    );

    // Labels — Inter
    final labelLarge = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: primaryText,
    );
    final labelMedium = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: secondaryText,
    );
    final labelSmall = GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: secondaryText,
    );

    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
