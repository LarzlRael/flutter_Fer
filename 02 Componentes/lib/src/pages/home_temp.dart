import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes Tempp')),
      body: ListView(children: _crearListaCorta()),
    );
  }

  /* List<Widget> _createItems() {
    List<Widget> lista = <Widget>[];

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      // lista.add(tempWidget);
      // lista.add(Divider());
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  } */

  List<Widget> _crearListaCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
              title: Text(item + '!'),
              subtitle: Text('Esta es otra cosas!'),
              leading: Icon(Icons.account_balance_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () {}),
          Divider(),
        ],
      );
    }).toList();
  }
}
