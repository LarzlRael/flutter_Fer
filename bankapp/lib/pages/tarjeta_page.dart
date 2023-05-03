part of 'pages.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Productos',
          style: TextStyle(
            color: Color(0xff734583),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: Container(
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
                  SizedBox(height: 10),
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
      fontSize: 13,
    );
    final TextStyle currentSald = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    return Stack(
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
        Positioned(
          top: 5,
          right: 0,
          child: Row(
            children: [
              IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.collections_bookmark_outlined,
                    size: 35,
                    color: Colors.white,
                  )),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.refresh_outlined,
                  size: 35,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 90,
          right: 0,
          child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              color: Colors.white,
              icon: Icon(Icons.cabin_outlined)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Saldo', style: style),
              SizedBox(height: 10),
              Text('Bs. ${prefs.saldo}', style: currentSald),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Caja de ahorro', style: style),
                  Text('163399882233', style: style),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _crearIcono(IconData icon, String label) {
    return Column(
      children: [
        SizedBox(height: 10),
        Icon(
          icon,
          color: Colors.green,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Solicita tu credito ahora',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Card(
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
