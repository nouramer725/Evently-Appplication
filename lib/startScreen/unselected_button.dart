import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import '../utils/responsive.dart';

class UnselectedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const UnselectedButton({
    required this.text,
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
              ? AppColors.inputsColorLight
              : AppColors.inputsColorDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppColors.strokeColorLight
                : AppColors.strokeColorDark,
          ),
        ),
        child: Text(
          text,
          style:
              Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppText.text14UnSelected
              : AppText.text14UnSelectedDark,
        ),
      ),
    );
  }
}
