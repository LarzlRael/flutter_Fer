part of 'pages.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Autenticación',
          style: TextStyle(
            color: Color(0xff734583),
          ),
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
          /* child: AssetImage('assets/backGround.jpg',fit: BoxFit.cover,), */
          child: Image.asset(
            'assets/backGround.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(25),
          child: Text(
            'Bienvenido a tu \nBanca online',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
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
          SizedBox(height: 50),
          GhostCurvedButton(
            title: 'Iniciar sesion',
            backgroundColor: Colors.green,
            onPressed: () {
              context.push('/home');
            },
          ),
          SizedBox(height: 80),
          CurvedButton(
            title: 'Soy cliente sin acceso a banca digital',
            onPressed: () {},
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 15),
          CurvedButton(
            title: 'Apertura de cuenta online',
            backgroundColor: Color(0xff734583),
          ),
        ],
      ),
    );
  }
}
