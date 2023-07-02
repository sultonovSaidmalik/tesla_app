import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum LocalGovernment {
  russia(Locale('ru', 'RU')),
  uzbek(Locale('uz', 'UZ')),
  english(Locale('en', 'US'));

  const LocalGovernment(this.locale);

  final Locale locale;

  static List<Locale> supportLocale() {
    return values.map((e) => e.locale).toList();
  }

  static const String path = 'assets/translations';

  static void func(BuildContext context, Locale locale) {
    context.setLocale(
      locale,
    );
    debugPrint(context.locale.toString());
  }
}
