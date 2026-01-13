import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class ProfileWidget extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function()? onTap;

  ProfileWidget({
    this.onTap,
    required this.text,
    required this.icon,
    super.key,
  });

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(12)),
      margin: EdgeInsets.symmetric(horizontal: w(16), vertical: h(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:
            Theme.of(context).appBarTheme.backgroundColor ==
                AppColors.backgroundColorLight
            ? AppColors.inputsColorLight
            : AppColors.inputsColorDark,
        border: Border.all(
          color:
              Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppColors.strokeColorLight
              : AppColors.strokeColorDark,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppText.text16Medium
                : AppText.text16MediumDark,
          ),
          InkWell(onTap: onTap, child: icon),
        ],
      ),
    );
  }
}
