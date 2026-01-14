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
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(w(12)),
      ),
      tileColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.mainColorLight.withOpacity(0.1)
          : AppColors.mainColorDark.withOpacity(0.2),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        Icons.check_circle,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.mainColorLight
            : AppColors.mainColorDark,
        size: w(28),
      ),
    );
  }

  Widget getUnSelectedRow(String text, BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(w(12)),
      ),
      title: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );

}
}
