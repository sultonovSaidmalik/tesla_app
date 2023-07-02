import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tesla/services/local_services.dart';

import 'app.dart';

class LocaleApp extends StatelessWidget {
  const LocaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: LocalGovernment.supportLocale(),
        path: LocalGovernment.path,
        startLocale: LocalGovernment.english.locale,
        child: const App());
  }
}