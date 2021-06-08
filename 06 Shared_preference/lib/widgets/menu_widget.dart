import 'package:flutter/material.dart';
import 'package:shared/shared_prefs/preferences_usuario.dart';
import 'package:shared/src/pages/home_page.dart';
import 'package:shared/src/pages/settings_page.dart';
import 'package:shared/theme/theme_settings.dart';

class MenuWidget extends StatelessWidget {
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        
        canvasColor: setBackGroundColor(),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: Icon(Icons.pages, color: color()),
              title: Text('Home', style: styleText()),
              onTap: () => Navigator.pushNamed(context, HomePage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.menu_sharp, color: color()),
              title: Text('People', style: styleText()),
              onTap: () => Navigator.pushNamed(context, SettingsPage.routename),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: color()),
              title: Text('Settings', style: styleText()),
              onTap: () => Navigator.pushNamed(context, SettingsPage.routename),
            ),
            ListTile(
              leading: Icon(Icons.people, color: color()),
              title: Text('People', style: styleText()),
              onTap: () => Navigator.pushReplacementNamed(
                  context, SettingsPage.routename),
            ),
          ],
        ),
      ),
    );
  }
}
