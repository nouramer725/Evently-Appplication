import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static TextStyle get text20SemiBold => GoogleFonts.poppins(
    color: AppColors.mainTextColorLight,
    fontSize: sp(20),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text20SemiBoldDark => GoogleFonts.poppins(
    color: AppColors.mainTextColorDark,
    fontSize: sp(20),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text20Medium => GoogleFonts.poppins(
    color: AppColors.inputsColorLight,
    fontSize: sp(20),
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text14SemiBold => GoogleFonts.poppins(
    color: AppColors.mainColorLight,
    fontSize: sp(14),
    fontWeight: FontWeight.w700,
  );


  static TextStyle get text16Regular => GoogleFonts.poppins(
    color: AppColors.secTextColorLight,
    fontSize: sp(16),
    fontWeight: FontWeight.w400,
    height: 1.5
  );

  static TextStyle get text16RegularDark => GoogleFonts.poppins(
      color: AppColors.secTextColorDark,
      fontSize: sp(16),
      fontWeight: FontWeight.w400,
      height: 1.5
  );

}
