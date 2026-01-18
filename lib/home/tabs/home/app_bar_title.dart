import 'package:evently_app/home/tabs/home/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../provider/app_language_provider.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class AppBarTitle extends StatefulWidget {
  const AppBarTitle({super.key});

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
    ];
    List<IconData> eventIconList = [
      Icons.grid_view_rounded,
      Icons.directions_bike,
      Icons.cake,
      Icons.museum,
      Icons.groups,
      Icons.menu_book,
    ];

    return Column(
      spacing: h(30),
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: AppText.regularText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.secTextColorDark
                        : AppColors.secTextColorLight,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Nour Muhammed",
                  style: AppText.regularText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.mainTextColorDark
                        : AppColors.mainTextColorLight,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              themeProvider.isDarkTheme()
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: themeProvider.isDarkTheme()
                  ? AppColors.mainColorDark
                  : AppColors.mainColorLight,
              size: h(30),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: w(8),
                vertical: h(5.5),
              ),
              margin: EdgeInsets.symmetric(horizontal: w(10)),
              decoration: BoxDecoration(
                color: themeProvider.isDarkTheme()
                    ? AppColors.mainColorDark
                    : AppColors.mainColorLight,
                border: Border.all(
                  color: AppColors.transparentColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                languageProvider.appLocal == "en" ? "En" : "Ar",
                style: AppText.semiBoldText(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        DefaultTabController(
          length: eventNameList.length,
          child: TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            dividerColor: AppColors.transparentColor,
            indicatorColor: AppColors.transparentColor,
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.symmetric(horizontal: w(5)),
            tabs: List.generate(eventNameList.length, (index) {
              return TabItem(
                widget: eventIconList[index],
                text: eventNameList[index],
                isSelected: selectedIndex == index,
              );
            }),
          ),
        ),
      ],
    );
  }
}
