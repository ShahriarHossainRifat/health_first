import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF1E3A5F);
  static const Color primaryDark = Color(0xFF0D2240);
  static const Color secondary = Color(0xFFFEC601);
  static const Color accent = Color(0xFF89A7FF);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primary, primaryDark],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF1A202C);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFFFFFFF);

  // Input / Surface Colors
  static const Color inputFill = Color(0xFFF7FAFC);
  static const Color inputBorder = Color(0xFFE2E8F0);
  static const Color surfaceLight = Color(0xFFE2E8F0);
  static const Color surfaceDark = Color(0xFF2C2C2C);

  // Container Colors
  static const Color lightContainer = Color(0xFFEBF4FF);

  // Utility Colors
  static const Color success = Color(0xFF38A169);
  static const Color warning = Color(0xFFD69E2E);
  static const Color error = Color(0xFFE53E3E);
  static const Color info = Color(0xFF3182CE);
}