import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLocal = 'en';
  String? language;
  void changeLanguage(String newLang) {
    if (newLang == appLocal) {
      return;
    }
    appLocal = newLang;
    language = appLocal;
    notifyListeners();
  }
}
