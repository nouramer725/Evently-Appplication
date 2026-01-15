import 'package:evently_app/home/tabs/profile/profile_widget.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../provider/app_language_provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import 'botton_sheet_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  String? language;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    final brightness = MediaQuery.of(context).platformBrightness;
    final bool systemIsDark = brightness == Brightness.dark;

    bool switchValue =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system && systemIsDark);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
        child: Column(
          spacing: h(12),
          children: [
            CircleAvatar(
              radius: w(70),
              backgroundImage: AssetImage(AppAssets.routeLogo),
            ),
            Text(
              "John Doe",
              style:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppText.text20SemiBold
                  : AppText.text20SemiBoldDark,
            ),
            Text(
              "johnsafwat.route@gmail.com",
              style:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppText.text14Regular
                  : AppText.text14RegularDark,
            ),
            ProfileWidget(
              text: AppLocalizations.of(context)!.darkmode,
              icon: Switch(
                value: switchValue,
                onChanged: (value) {
                  themeProvider.changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
                activeThumbColor:
                    Theme.of(context).appBarTheme.backgroundColor ==
                        AppColors.backgroundColorLight
                    ? AppColors.mainColorLight
                    : AppColors.mainColorDark,
                inactiveThumbColor:
                    Theme.of(context).appBarTheme.backgroundColor ==
                        AppColors.backgroundColorLight
                    ? AppColors.disableColorLight
                    : AppColors.disableColorDark,
              ),
            ),
            ProfileWidget(
              text: languageProvider.language == null
                  ? AppLocalizations.of(context)!.language
                  : languageProvider.appLocal == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              icon: Icon(
                Icons.arrow_forward_ios,
                color:
                    Theme.of(context).appBarTheme.backgroundColor ==
                        AppColors.backgroundColorLight
                    ? AppColors.mainColorLight
                    : AppColors.mainColorDark,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottonSheetComponent();
                  },
                );
              },
            ),
            ProfileWidget(
              text: AppLocalizations.of(context)!.logout,
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.startScreenName,
                  (route) => false,
                );
              },
              icon: Image.asset(AppAssets.logOutIcon),
            ),
          ],
        ),
      ),
    );
  }
}
