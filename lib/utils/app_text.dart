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

  static TextStyle get text20BoldDark => GoogleFonts.poppins(
    color: AppColors.mainColorDark,
    fontSize: sp(20),
    fontWeight: FontWeight.bold,
    height: 1.5,
  );


  static TextStyle get text18Medium => GoogleFonts.poppins(
    color: AppColors.mainColorLight,
    fontSize: sp(20),
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text18MediumDark => GoogleFonts.poppins(
    color: AppColors.inputsColorLight,
    fontSize: sp(20),
    fontWeight: FontWeight.w600,
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

  static TextStyle get text14SemiBoldDark => GoogleFonts.poppins(
    color: AppColors.mainTextColorDark,
    fontSize: sp(14),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text14UnSelected => GoogleFonts.poppins(
    color: AppColors.mainColorLight,
    fontSize: sp(14),
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text14UnSelectedDark => GoogleFonts.poppins(
    color: AppColors.inputsColorLight,
    fontSize: sp(14),
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text14SemiBoldWhite => GoogleFonts.poppins(
    color: AppColors.inputsColorLight,
    fontSize: sp(14),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text16Regular => GoogleFonts.poppins(
    color: AppColors.secTextColorLight,
    fontSize: sp(16),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get text14Regular => GoogleFonts.poppins(
    color: AppColors.secTextColorLight,
    fontSize: sp(14),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get text14RegularDark => GoogleFonts.poppins(
    color: AppColors.secTextColorDark,
    fontSize: sp(14),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get text12Regular => GoogleFonts.poppins(
    color: AppColors.mainColorLight,
    fontSize: sp(12),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static TextStyle get text12RegularDark => GoogleFonts.poppins(
    color: AppColors.mainColorDark,
    fontSize: sp(12),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static TextStyle get text12RegularUnSelected => GoogleFonts.poppins(
    color: AppColors.disableColorLight,
    fontSize: sp(12),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static TextStyle get text12RegularUnSelectedDark => GoogleFonts.poppins(
    color: AppColors.disableColorDark,
    fontSize: sp(12),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get text16RegularDark => GoogleFonts.poppins(
    color: AppColors.secTextColorDark,
    fontSize: sp(16),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get text16MediumDark => GoogleFonts.poppins(
    color: AppColors.mainTextColorDark,
    fontSize: sp(16),
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle get text16Medium => GoogleFonts.poppins(
    color: AppColors.mainTextColorLight,
    fontSize: sp(16),
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
}
