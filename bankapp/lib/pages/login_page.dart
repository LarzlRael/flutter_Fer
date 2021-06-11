import 'package:bankapp/bloc/bloc.dart';
import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:bankapp/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Autenticacion',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _createBackGround(context),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  child: _login(context),
                )
              ],
            )

            /*
            _createButtons() */
          ],
        ),
      ),
    );
  }

  Widget _createBackGround(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: query.height * .25,
          width: double.infinity,
          child: FadeInImage(
            image: AssetImage('assets/backGround.jpg'),
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/loading.gif'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(25),
          child: Text(
            'Bienvenido a tu \nBanca online',
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
      ],
    );
  }

  Widget _login(BuildContext context) {
    final bloc = Bloc();
    final prefs = UserPreferences();
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            decoration: BoxDecoration(),
            child: StreamBuilder(
              stream: bloc.nameStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      errorText: snapshot.error != null
                          ? snapshot.error.toString()
                          : null,
                    ),
                    onChanged: (value) {
                      bloc.changeName(value);
                      prefs.name = value;
                      prefs.email = value;
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              style: TextButton.styleFrom(),
              child: Text('Inciar sesion',
                  style: TextStyle(color: Theme.of(context).accentColor)),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          singleButton(
            context,
            'Soy cliente sin acceso a banca digital',
            'afiliacion',
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 15,
          ),
          singleButton(
            context,
            'Apertura de cuenta online',
            '/home',
            color: Color(0xff734583),
          ),
        ],
      ),
    );
  }
}
