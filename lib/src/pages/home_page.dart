import 'package:flutter/material.dart';
import 'package:preferences_users/src/shared_preferences/preferences_user.dart';

import '../widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const String nameRoute = 'home';
  final preferences = PreferencesUser();

  @override
  Widget build(BuildContext context) {
    preferences.lastPage = HomePage.nameRoute;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Preferences of users'),
          backgroundColor:
              (preferences.colorSecundario) ? Colors.teal : Colors.blueAccent,
        ),
        drawer: const MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Color secundario: ${preferences.colorSecundario}'),
            Divider(),
            Text('Género: ${preferences.genero}'),
            Divider(),
            Text('Name user: ${preferences.name}')
          ],
        ));
  }
}
