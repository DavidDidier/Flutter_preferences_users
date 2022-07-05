import 'package:flutter/material.dart';
import 'package:preferences_users/src/shared_preferences/preferences_user.dart';

import 'src/pages/home_page.dart';
import 'src/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = PreferencesUser();
  await preferences.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final preferences = PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Preferences',
        initialRoute: preferences.lastPage,
        routes: {
          HomePage.nameRoute: (BuildContext context) => HomePage(),
          SettingsPage.nameRoute: (BuildContext context) => const SettingsPage()
        });
  }
}
