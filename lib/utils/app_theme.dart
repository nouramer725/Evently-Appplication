import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColorLight,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColorLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.mainColorLight),
      actionsIconTheme: IconThemeData(color: AppColors.mainColorLight),
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.mainTextColorLight),
      bodyLarge: TextStyle(color: AppColors.mainTextColorLight),
      labelLarge: TextStyle(color: AppColors.mainColorLight),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColorLight,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.inputsColorLight,
        foregroundColor: AppColors.mainColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.strokeColorLight),
        ),
        textStyle: AppText.text14SemiBold,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColorDark,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColorDark,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.mainColorDark),
        actionsIconTheme: IconThemeData(color: AppColors.mainColorDark),
      ),

      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppColors.mainTextColorDark),
        bodyLarge: TextStyle(color: AppColors.mainTextColorDark),
        labelLarge: TextStyle(color: AppColors.mainColorDark),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColorDark,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.inputsColorDark,
          foregroundColor: AppColors.mainColorDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.strokeColorDark),
          ),
          textStyle: AppText.text14SemiBold,
        ),
      )
  );
}
