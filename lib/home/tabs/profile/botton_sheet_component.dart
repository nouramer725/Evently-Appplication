import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:evently_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_language_provider.dart';
import '../../../utils/app_colors.dart';

class BottonSheetComponent extends StatelessWidget {
  const BottonSheetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
      child: Column(
        spacing: h(20),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLocal == 'ar'
                ? getSelectedRow(AppLocalizations.of(context)!.arabic, context)
                : getUnSelectedRow(
                    AppLocalizations.of(context)!.arabic,
                    context,
                  ),
          ),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLocal == 'en'
                ? getSelectedRow(AppLocalizations.of(context)!.english, context)
                : getUnSelectedRow(
                    AppLocalizations.of(context)!.english,
                    context,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedRow(String text, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppText.text20SemiBold
              : AppText.text20SemiBoldDark,
        ),
        Icon(
          Icons.check,
          color:
              Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppColors.mainColorLight
              : AppColors.mainColorDark,
        ),
      ],
    );
  }

  Widget getUnSelectedRow(String text, BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).appBarTheme.backgroundColor ==
              AppColors.backgroundColorLight
          ? AppText.text20SemiBold
          : AppText.text20SemiBoldDark,
    );
  }
}
