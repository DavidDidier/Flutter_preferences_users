import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instance = PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }

  PreferencesUser._internal();

  late SharedPreferences _preferences;

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //GET and SET del genero

  int get genero {
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int valor) {
    _preferences.setInt('genero', valor);
  }

  //GET and SET del color secundario
  bool get colorSecundario {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool valor) {
    _preferences.setBool('genero', valor);
  }

  //GET and SET del nombre
  String get name {
    return _preferences.getString('name') ?? '';
  }

  set name(String valor) {
    _preferences.setString('name', valor);
  }
}
