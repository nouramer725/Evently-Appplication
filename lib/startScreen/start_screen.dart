import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:evently_app/startScreen/selected_Button.dart';
import 'package:evently_app/startScreen/selected_button_theme.dart';
import 'package:evently_app/startScreen/un_selected_button_theme.dart';
import 'package:evently_app/startScreen/unselected_button.dart';
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
            spacing: h(16),
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
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.language,
                      style:
                          Theme.of(context).appBarTheme.backgroundColor ==
                              AppColors.backgroundColorLight
                          ? AppText.text18Medium
                          : AppText.text18MediumDark,
                    ),
                  ),
                  Row(
                    spacing: w(8),
                    children: [
                      languageProvider.language == null
                          ? SelectedButton(
                              text: AppLocalizations.of(context)!.english,
                              onPressed: () =>
                                  languageProvider.changeLanguage('en'),
                            )
                          : languageProvider.language == 'en'
                          ? SelectedButton(
                              text: AppLocalizations.of(context)!.english,
                              onPressed: () =>
                                  languageProvider.changeLanguage('en'),
                            )
                          : UnselectedButton(
                              text: AppLocalizations.of(context)!.english,
                              onPressed: () =>
                                  languageProvider.changeLanguage('en'),
                            ),
                      languageProvider.language == 'ar'
                          ? SelectedButton(
                              text: AppLocalizations.of(context)!.arabic,
                              onPressed: () =>
                                  languageProvider.changeLanguage('ar'),
                            )
                          : UnselectedButton(
                              text: AppLocalizations.of(context)!.arabic,
                              onPressed: () =>
                                  languageProvider.changeLanguage('ar'),
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
                      themeProvider.appTheme == ThemeMode.light
                          ? SelectedButtonTheme(
                              icon: Icons.light_mode,
                              onPressed: () =>
                                  themeProvider.changeTheme(ThemeMode.light),
                            )
                          : UnSelectedButtonTheme(
                              icon: Icons.light_mode_outlined,
                              onPressed: () =>
                                  themeProvider.changeTheme(ThemeMode.light),
                            ),

                      themeProvider.appTheme == ThemeMode.dark
                          ? SelectedButtonTheme(
                              icon: Icons.dark_mode,
                              onPressed: () =>
                                  themeProvider.changeTheme(ThemeMode.dark),
                            )
                          : UnSelectedButtonTheme(
                              icon: Icons.dark_mode_outlined,
                              onPressed: () =>
                                  themeProvider.changeTheme(ThemeMode.dark),
                            ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.onBoardingScreenName);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: h(9),
                    horizontal: w(16),
                  ),
                  margin: EdgeInsets.symmetric(vertical: h(9)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        Theme.of(context).appBarTheme.backgroundColor ==
                            AppColors.backgroundColorLight
                        ? AppColors.mainColorLight
                        : AppColors.mainColorDark,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.letStart,
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
}
