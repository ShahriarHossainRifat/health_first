import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: App_BarTheme.lightAppBarTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: App_BarTheme.darkAppBarTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme);
}
