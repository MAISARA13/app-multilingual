
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learningapp/learner/Screens/learner_walk_through.dart';

import 'learner/Screens/al_fatihah/alfatihah.comic.screen.dart';
import 'learner/Screens/al_fatihah/alfatihah.home.screen.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppTheme.dart';

AppStore appStore = AppStore();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          // '/': (context) => LearnerWalkThrough(),
          '/alfatihah': (context) => const AlFatihahScreen(),
          '/comic': (context) => const PlayPauseAnimation(),
        },
        localeResolutionCallback: (locale, supportedLocales) => locale,
        locale: Locale(appStore.selectedLanguageCode),
      ),
    );
  }
}
