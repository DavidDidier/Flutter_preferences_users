import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.pages, color: Colors.blueAccent),
              title: const Text('Home'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.nameRoute)),
          ListTile(
            leading: const Icon(Icons.person_add, color: Colors.blueAccent),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blueAccent),
            title: const Text('Settings'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, SettingsPage.nameRoute),
          )
        ],
      ),
    );
  }
}
