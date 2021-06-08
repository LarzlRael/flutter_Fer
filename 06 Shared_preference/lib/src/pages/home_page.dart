import 'package:flutter/material.dart';
import 'package:shared/shared_prefs/preferences_usuario.dart';
import 'package:shared/theme/theme_settings.dart';
import 'package:shared/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();

    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefencias de usuario'),
        backgroundColor: setAppBarColor(),
      ),
      backgroundColor: setBackGroundColor(),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Thema oscuro : ${prefs.darkTheme} ',
              style: styleText()),
          Divider(),
          Text("Genero : ${prefs.genero == 1 ? 'masculino' : 'femenino'}",
              style: styleText()),
          Divider(),
          Text('Nombre de usuario : ${prefs.nombreUsuario}',
              style: styleText()),
          Divider(),
        ],
      ),
    );
  }
}
