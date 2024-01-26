import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _selectedLocale = Locale('en');

  Locale get selectedLocale => _selectedLocale;

  void setLocale(Locale newLocale) {
    _selectedLocale = newLocale;
    notifyListeners();
  }
}
