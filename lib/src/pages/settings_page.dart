import 'package:flutter/material.dart';
import 'package:preferences_users/src/shared_preferences/preferences_user.dart';

import '../widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String nameRoute = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Didier';

  late TextEditingController _textEditingController;

  final preferences = PreferencesUser();
  @override
  void initState() {
    super.initState();
    _genero = preferences.genero;
    _colorSecundario = preferences.colorSecundario;

    _textEditingController = TextEditingController(text: preferences.name);
  }

  _setSelectedRadio(int valor) {
    preferences.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor:
              (preferences.colorSecundario) ? Colors.teal : Colors.blueAccent,
        ),
        drawer: const MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: const Text('Color secundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                    preferences.colorSecundario = value;
                  });
                }),
            RadioListTile(
                toggleable: true,
                value: 1,
                title: const Text('Masculino'),
                groupValue: _genero,
                onChanged: (value) {
                  setState(() {
                    _setSelectedRadio;
                  });
                }),
            RadioListTile(
                toggleable: true,
                value: 2,
                title: const Text('Femenino'),
                groupValue: _genero,
                onChanged: (value) {
                  setState(() {
                    _setSelectedRadio;
                  });
                }),
            const Divider(),
            Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre de la persona ome'),
                  onChanged: (value) {
                    preferences.name = value;
                  },
                ))
          ],
        ));
  }
}
