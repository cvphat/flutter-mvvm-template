import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({
    super.key,
    required this.home,
    required this.localizationsDelegates,
  });
  final Widget home;
  final Iterable<LocalizationsDelegate> localizationsDelegates;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      localizationsDelegates: localizationsDelegates,
    );
  }
}
