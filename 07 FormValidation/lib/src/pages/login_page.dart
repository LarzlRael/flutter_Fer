import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _createBackGround(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _createBackGround(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0),
        ]),
      ),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
    return Stack(
      children: [
        fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, right: -30.0, child: circle),
        Positioned(top: -50.0, right: -10.0, child: circle),
        Positioned(top: 120.0, right: 20.0, child: circle),
        Positioned(top: -50.0, left: -20.0, child: circle),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Rey GT',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                crearPassword(bloc),
                SizedBox(height: 30.0),
                _createButton(bloc),
              ],
            ),
          ),
          Text('¿Olvido la contraseña ?'),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
                hintText: 'ejemplo@corre.com',
                labelText: 'Correo electronico',
                counter: Text(snapshot.data != null ? snapshot.data : ''),
                errorText: snapshot.error.toString()),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_clock_outlined, color: Colors.deepPurple),
              labelText: 'Contraseña',
              counter: Text(snapshot.data != null ? snapshot.data : ''),
              errorText: snapshot.error.toString(),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('snapshot state : ==> ${snapshot.hasData}');
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10),
            child: Text(
              'Ingresar',
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
          ),
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
        );
      },
    );
  }

  void _login(LoginBloc bloc, BuildContext context) {
    print('============');
    print('Email => ${bloc.email}');
    print('password => ${bloc.password}');
    print('============');
    Navigator.pushReplacementNamed(context, 'home');
  }
}
