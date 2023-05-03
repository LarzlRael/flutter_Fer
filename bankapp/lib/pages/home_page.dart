part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = UserPreferences();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlert(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /* Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/backGround.jpg'),
                fit: BoxFit.cover,
              ),
            ), */
            Image.asset(
              'assets/backGround.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _createLogo(),
                  SizedBox(height: 10),
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
      fontSize: 35,
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

    return Column(
      children: [
        CurvedButton(
          title: 'Utilizar Contraseña',
          onPressed: _submit,
          /* backgroundColor: Theme.of(context).colorScheme.primary, */
        ),
        CurvedButton(
          title: 'Cerrar sesion',
          onPressed: () {
            context.go('/');
          },
          backgroundColor: Color(0xff734583),
        )
      ],
    );
  }

  _showAlertMessage(BuildContext context) {
    return Center(
      child: FilledButton(
        child: Text('Mostrar Alerta'),
        onPressed: () => _showAlert(context),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    final TextStyle textsytle = TextStyle(fontSize: 12);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ingreso por huella digital', style: textsytle),
              SizedBox(height: 5),
              Icon(
                Icons.fingerprint,
                size: 40.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 5),
              Text('Este es el contendio de la caja de alerta',
                  style: textsytle),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: CurvedButton(
                  onPressed: () {
                    context.go('/menu_options');
                  },
                  title: 'Utilizar contraseña',
                  backgroundColor: Color(0xff734583),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _submit() async {
    final userProvider = UserProvider();
    Map resp = await userProvider.login(prefs.email, prefs.password);

    if (resp['ok']) {
      context.pushReplacementNamed('menu_options');
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
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
