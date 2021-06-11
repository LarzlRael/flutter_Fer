import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Productos',
          style: TextStyle(
            color: Color(0xff734583),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  _createCreditCard(context),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _crearIcono(Ionicons.add, "Pago/Cobro QR"),
                      _crearIcono(Ionicons.card, "Transefrencias"),
                      _crearIcono(Icons.airplanemode_active, "Extracto"),
                      _crearIcono(Ionicons.wallet_outline, "Extracto historico")
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FadeInImage(
                        height: query.height * 0.3,
                        placeholder: AssetImage('assets/loading.gif'),
                        image: AssetImage('assets/publicidad.jpg')),
                  )
                ],
              ),
              _crearTableWithInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCreditCard(BuildContext context) {
    UserPreferences prefs = UserPreferences();

    final query = MediaQuery.of(context).size;
    final TextStyle style = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    final TextStyle currentSald = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    return Center(
      child: Stack(
        children: [
          Container(
              height: query.height * 0.25,
              width: query.width * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: AssetImage('assets/tarjeta.jpg'),
                  fit: BoxFit.cover,
                ),
              )

              /* decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ), */
              ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo',
                  style: style,
                ),
                SizedBox(height: 10),
                Text(
                  '${prefs.saldo} Bs.',
                  style: currentSald,
                ),
                SizedBox(height: 20),
                Text(
                  'Caja de ahorro',
                  style: style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearIcono(IconData icon, String label) {
    return Column(
      children: [
        SizedBox(height: 10),
        Icon(
          icon,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    );
  }

  Widget _crearTableWithInfo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(
            'Solicita de credito ahora',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: 25),
          Card(
            child: Expanded(
              child: Table(
                children: [
                  TableRow(
                    children: [
                      _cardTipo2('Credito Consumo'),
                      _cardTipo2('Credito vivienda'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _cardTipo2('Credito Vehiculo'),
                      _cardTipo2('Tarjeta de Crédito'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2(String label) {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://photographycourse.net/wp-content/uploads/2014/11/Landscape-Photography-steps.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 100.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/loading.gif'),
          ),
          Container(
            /* padding: EdgeInsets.all(10.0), */
            child: Container(
              decoration: BoxDecoration(color: Color(0xff01B55A)),
              padding: EdgeInsets.all(5),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: card,
        ));
  }
}
