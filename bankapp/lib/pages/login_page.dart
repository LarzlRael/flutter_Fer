import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              _createButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createLogo() {
    final TextStyle style = TextStyle(
      fontSize: 40,
      color: Colors.black12,
      fontWeight: FontWeight.bold,
    );
    return Center(child: Text('Este el logo we', style: style));
  }

  Widget _createGreetings() {
    final TextStyle style = TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return Center(
      child: Column(
        children: [
          Text('#Hola Juan', style: style),
          Text('#Quedate en casa we', style: style),
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
            onPressed: () {
              Navigator.pushNamed(
                context,
                'menuOptions',
              );
            },
            child: Text('Utilizar Contraseña', style: style),
            style: buttonStyle(Color(0xff01B55A)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
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
              Icon(Icons.fingerprint, size: 60.0, color: Color(0xff01B55A)),
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
                  Navigator.pushNamed(
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
}
