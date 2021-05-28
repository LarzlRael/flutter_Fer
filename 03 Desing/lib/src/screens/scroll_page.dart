import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: [_colorFondo(), _imagenFondo(), _textos()],
    );
  }

  Widget _pagina2() {
    final raisedButtonStyle = ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0));
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: ElevatedButton(
            onPressed: () {},
            child: Text('Bienvenido', style: TextStyle(fontSize: 20.0)),
            style: raisedButtonStyle),
      ),
    );
  }

  Widget _colorFondo() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(108, 192, 218, 1.0));
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    final now = DateTime.now();
    final styleText = TextStyle(color: Colors.white, fontSize: 50);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Text('${now.day}', style: styleText),
          Text('${getDayNamed(now.weekday)}', style: styleText),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white),
        ],
      ),
    );
  }
}

String getDayNamed(int weekday) {
  switch (weekday) {
    case 1:
      return 'Lunes';
    case 2:
      return 'Martes';
    case 3:
      return 'Miercoles';
    case 4:
      return 'Jueves';
    case 5:
      return 'Viernes';
    case 6:
      return 'Sabado';
    case 7:
      return 'Domingo';
      break;
    default:
      return 'xD';
  }
}
