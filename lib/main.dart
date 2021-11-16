import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learningapp/learner/Screens/learner_walk_through.dart';

import 'learner/Screens/al_fatihah/alfatihah.home.screen.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppTheme.dart';

AppStore appStore = AppStore();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LearnerWalkThrough(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        routes: {
          '/alfatihah': (context) => const AlFatihahScreen(),
        },
        localeResolutionCallback: (locale, supportedLocales) => locale,
        locale: Locale(appStore.selectedLanguageCode),
      ),
    );
  }
}
