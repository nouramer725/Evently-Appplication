import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class SelectedButtonTheme extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const SelectedButtonTheme({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(5.5)),
        decoration: BoxDecoration(
          color:
              Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppColors.mainColorLight
              : AppColors.mainColorDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppColors.strokeColorLight
                : AppColors.strokeColorDark,
          ),
        ),
        child: Icon(
          icon,
          color:
              Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppColors.inputsColorLight
              : AppColors.inputsColorLight,
        ),
      ),
    );
  }
}
