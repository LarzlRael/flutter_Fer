import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hidePassword = true;
  String textFieldValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/backGround.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _createLogo(),
                  SizedBox(
                    height: 10,
                  ),
                  _createGreetings(),
                  _showAlertMessage(context),
                  Spacer(),
                  _createPasswordField(),
                  _createButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLogo() {
    final TextStyle style = TextStyle(
      fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Center(child: Text('Este el logo we', style: style));
  }

  Widget _createGreetings() {
    final prefs = UserPreferences();

    final TextStyle style = TextStyle(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Center(
      child: Column(
        children: [
          Text('#Hola ${prefs.name}', style: style),
          Text('#Quedate en casa', style: style),
        ],
      ),
    );
  }

  Widget _createButtons(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: 14,
    );
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            child: Text('Utilizar Contraseña', style: style),
            style: buttonStyle(Theme.of(context).accentColor),
            onPressed: () {
              if (textFieldValue == '1234') {
                Navigator.pushReplacementNamed(context, 'menuOptions');
              }
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Cerrar sesion', style: style),
            style: buttonStyle(Color(0xff734583)),
          ),
        )
      ],
    );
  }

  _showAlertMessage(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Mostra Alerta'),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: StadiumBorder(),
        ),
        onPressed: () => _showAlert(context),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    final TextStyle textsytle = TextStyle(fontSize: 14);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ingreso por Huella digital', style: textsytle),
              Icon(Icons.fingerprint,
                  size: 60.0, color: Theme.of(context).accentColor),
              SizedBox(
                height: 10,
              ),
              Text('Este es el contendio de la caja de alerta',
                  style: textsytle),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    'menuOptions',
                  );
                },
                child: Text('Utilizar contraseña'),
                style: buttonStyle(Color(0xff734583)),
              ),
            ),
          ],
        );
      },
    );
  }

  ButtonStyle buttonStyle(Color color) {
    return TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        backgroundColor: color);
  }

  Widget _createPasswordField() {
    return Visibility(
      visible: true,
      child: Container(
        padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: TextField(
          keyboardType: TextInputType.number,
          maxLength: 4,
          obscureText: hidePassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: 'Clave',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = hidePassword ? false : true;
                });
              },
              icon: Icon(hidePassword ? Ionicons.eye_off : Ionicons.eye),
            ),
          ),
          onChanged: (value) {
            textFieldValue = value;
          },
        ),
      ),
    );
  }
}
