import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/app_text.dart';
import '../utils/responsive.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppAssets.eventlyLogo
              : AppAssets.eventlyLogoDark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: h(15),
          children: [
            Image.asset(
              Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppAssets.startScreen
                  : AppAssets.startScreenDark,
              fit: BoxFit.cover,
              height: h(343),
            ),
            Text(
              "Personalize Your Experience",
              style:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppText.text20SemiBold
                  : AppText.text20SemiBoldDark,
            ),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppText.text16Regular
                  : AppText.text16RegularDark,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style:
                      Theme.of(context).appBarTheme.backgroundColor ==
                          AppColors.backgroundColorLight
                      ? AppText.text18Medium
                      : AppText.text18MediumDark,
                ),
                Row(
                  spacing: w(8),
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("English")),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.inputsColorLight,
                        foregroundColor: AppColors.mainColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColors.strokeColorLight),
                        ),
                        textStyle: AppText.text14Regular,
                      ),
                      onPressed: () {},
                      child: Text("Arabic"),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style:
                      Theme.of(context).appBarTheme.backgroundColor ==
                          AppColors.backgroundColorLight
                      ? AppText.text18Medium
                      : AppText.text18MediumDark,
                ),
                Row(
                  spacing: w(8),
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.light_mode, size: w(24)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.inputsColorLight,
                        foregroundColor: AppColors.mainColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColors.strokeColorLight),
                        ),
                        textStyle: AppText.text14Regular,
                      ),
                      onPressed: () {},
                      child: Icon(Icons.dark_mode_outlined, size: w(24)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.onBoardingScreenName,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: h(9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text("Get Started", style: AppText.text20Medium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
