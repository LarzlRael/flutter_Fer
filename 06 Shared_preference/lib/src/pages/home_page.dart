import 'package:flutter/material.dart';
import 'package:shared/shared_prefs/preferences_usuario.dart';
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
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      backgroundColor: (prefs.darkTheme) ? Colors.black12 : Colors.white,
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario : ${prefs.colorSecundario} ',
              style: styleText()),
          Divider(),
          Text('Genero : ${prefs.genero}', style: styleText()),
          Divider(),
          Text('Nombre de usuario : ${prefs.nombreUsuario}',
              style: styleText()),
          Divider(),
        ],
      ),
    );
  }

  TextStyle styleText() {
    final prefs = new UserPreferences();

    return TextStyle(
      color: prefs.darkTheme ? Colors.white : Colors.black,
      fontSize: 22,
    );
  }
}
