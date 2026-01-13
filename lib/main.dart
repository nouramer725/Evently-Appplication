import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/startScreen/start_screen.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:evently_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'l10n/app_localizations.dart';
import 'onBoarding/onBoarding_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppLanguageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    SizeConfig.init(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      locale: Locale(languageProvider.appLocal),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.startScreenName,
      routes: {
        AppRoutes.startScreenName: (context) => StartScreen(),
        AppRoutes.onBoardingScreenName: (context) => OnboardingScreen(),
        AppRoutes.homeScreenName: (context) => HomeScreen(),
      },
    );
  }
}
