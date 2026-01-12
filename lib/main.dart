import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:evently_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'l10n/app_localizations.dart';
import 'onBoarding/onBoarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreenName,
      routes: {
        AppRoutes.onBoardingScreenName: (context) => OnboardingScreen(),
        AppRoutes.homeScreenName: (context) => HomeScreen(),
      },
    );
  }
}
