import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationManager {
  initLocalization() async {
    await EasyLocalization.ensureInitialized();
  }

  final enLocale = const Locale('en', 'US');

  List<Locale> get supportedLocales => [enLocale];

  static final LocalizationManager _instance = LocalizationManager._init();
  LocalizationManager._init();
  static LocalizationManager get getInstance => _instance;
}
