import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mvvm_template/ui/theme/them_builder.dart';
import 'package:flutter_mvvm_template/ui/views/home/home_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  prefs = await SharedPreferences.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String rawLocale = prefs.getString('language') ?? 'en_US';
    String replaceLocale = rawLocale.replaceAll('_', '-');
    List<String> localeList = replaceLocale.split('-');
    Locale locale = Locale(localeList[0], localeList[1]);

    return ThemeBuilder(
      home: const HomeView(),
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            fallbackFile: 'en_US',
            forcedLocale: locale,
            basePath: 'assets/i18n',
            useCountryCode: true,
          ),
          missingTranslationHandler: (key, locale) {
            //TODO: Log here
          },
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
