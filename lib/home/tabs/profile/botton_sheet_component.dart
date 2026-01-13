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
                ? getSelectedRow(AppLocalizations.of(context)!.arabic)
                : getUnSelectedRow(AppLocalizations.of(context)!.arabic),
          ),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLocal == 'en'
                ? getSelectedRow(AppLocalizations.of(context)!.english)
                : getUnSelectedRow(AppLocalizations.of(context)!.english),
          ),
        ],
      ),
    );
  }

  Widget getSelectedRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppText.text20SemiBold),
        Icon(Icons.check, color: AppColors.mainColorLight),
      ],
    );
  }

  Widget getUnSelectedRow(String text) {
    return Text(text, style: AppText.text20SemiBold);
  }
}
