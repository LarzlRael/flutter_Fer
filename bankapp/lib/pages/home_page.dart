import 'package:bankapp/provider/user_provider.dart';
import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:bankapp/widgets/input_password.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = UserPreferences();

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
                  InputPassword(),
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
    final userProvider = UserProvider();
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
              _submit();
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

  void _submit() async {
    final userProvider = UserProvider();
    Map resp = await userProvider.login(prefs.email, prefs.password);
    print('respuesta : ');
    print(resp);
    if (resp['ok']) {
      Navigator.pushReplacementNamed(context, 'menuOptions');
    } else {
      print(resp);
      showDialogError(resp['mensaje']);
    }
  }

  void showDialogError(String label) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Error'),
        content: Text(label),
        actions: <Widget>[
          // TextButton(
          //   onPressed: () => Navigator.pop(context, 'Cancel'),
          //   child: const Text('Cancel'),
          // ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
