import 'package:flutter/material.dart';
import 'package:shared/shared_prefs/preferences_usuario.dart';
import 'package:shared/theme/theme_settings.dart';
import 'package:shared/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routename = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  bool _darkTheme = false;
  int _genero;
  String _nombre = 'Pedro';

  var myController = TextEditingController();
  final prefs = UserPreferences();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    prefs.lastPage = SettingsPage.routename;
    myController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes page'),
        backgroundColor: setAppBarColor(),
        /* (prefs.colorSecundario) ? Colors.blueGrey : Colors.blue, */
      ),
      backgroundColor: setBackGroundColor(),
      drawer: MenuWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 35.0,
                  color: prefs.darkTheme ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              
              value: _colorSecundario,
              title: Text('Color secundario', style: styleText()),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
            ),
            SwitchListTile(
              value: prefs.darkTheme,
              
              title: Text('Tema oscuro', style: styleText()),
              onChanged: (value) {
                setState(() {
                  _darkTheme = value;
                  prefs.darkTheme = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino', style: styleText()),
              groupValue: _genero,
              
              onChanged: (value) {
                setState(() {
                  _setSelectRadio(value);
                });
              },
            ),
            RadioListTile(
              value: 2,
              
              title: Text('Femenino', style: styleText()),
              groupValue: _genero,
              onChanged: (value) {
                _setSelectRadio(value);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                style: styleText(),
                controller: myController,
                decoration: InputDecoration(
                    labelStyle: styleText(),
                    hintStyle: styleText(),
                    helperStyle: styleText(),
                    fillColor: Colors.white,
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
