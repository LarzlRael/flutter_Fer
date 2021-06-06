import 'package:flutter/material.dart';
import 'package:shared_preferences/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Pages'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: () => Navigator.pushNamed(context, SettingsPage.routename),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('People'),
            onTap: () => Navigator.pushNamed(context, SettingsPage.routename),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, SettingsPage.routename),
          ),
        ],
      ),
    );
  }
}
