import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_language_provider.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/app_text.dart';
import '../utils/responsive.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
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
        child: SingleChildScrollView(
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
                AppLocalizations.of(context)!.title4,
                style:
                    Theme.of(context).appBarTheme.backgroundColor ==
                        AppColors.backgroundColorLight
                    ? AppText.text20SemiBold
                    : AppText.text20SemiBoldDark,
              ),
              Text(
                AppLocalizations.of(context)!.text4,
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
                    AppLocalizations.of(context)!.language,
                    style:
                        Theme.of(context).appBarTheme.backgroundColor ==
                            AppColors.backgroundColorLight
                        ? AppText.text18Medium
                        : AppText.text18MediumDark,
                  ),
                  Row(
                    spacing: w(8),
                    children: [
                      languageProvider.language == null
                          ? selectedButton(
                              AppLocalizations.of(context)!.english,
                              () => languageProvider.changeLanguage('en'),
                            )
                          : languageProvider.language == 'en'
                          ? selectedButton(
                              AppLocalizations.of(context)!.english,
                              () => languageProvider.changeLanguage('en'),
                            )
                          : unSelectedButton(
                              AppLocalizations.of(context)!.english,
                              () => languageProvider.changeLanguage('en'),
                            ),
                      languageProvider.language == 'ar'
                          ? selectedButton(
                              AppLocalizations.of(context)!.arabic,
                              () => languageProvider.changeLanguage('ar'),
                            )
                          : unSelectedButton(
                              AppLocalizations.of(context)!.arabic,
                              () => languageProvider.changeLanguage('ar'),
                            ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
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
                        onPressed: () {
                          // themeProvider.changeTheme(ThemeMode.light);
                        },
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
                        ),
                        onPressed: () {
                          // themeProvider.changeTheme(ThemeMode.dark);
                        },
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
                  child: Text(
                    AppLocalizations.of(context)!.getstarted,
                    style: AppText.text20Medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectedButton(String text, Function() onPressed) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  Widget unSelectedButton(String text, Function() onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.inputsColorLight,
        foregroundColor: AppColors.mainColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.strokeColorLight),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
