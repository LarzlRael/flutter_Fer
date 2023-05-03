part of 'pages.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool useFinger = false;
  late bool isDarkModeEnabled;
  @override
  Widget build(BuildContext context) {
    final themeProviderNotifier = context.watch<ThemeProviderNotifier>();
    isDarkModeEnabled = themeProviderNotifier.isDarkModeEnabled;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuario',
          style: TextStyle(
            color: Color(0xff734583),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          _createProfile(context),
          _customListTile(
            Icon(Icons.fingerprint, size: 30),
            'Ingresar con Huella',
            () {},
            trailing: Switch(
              value: useFinger,
              onChanged: (value) {
                setState(() {
                  useFinger = value;
                });
              },
            ),
          ),
          _customListTile(
            Icon(Icons.color_lens, size: 30),
            'Cambiar Tema',
            () {
              themeProviderNotifier.toggleTheme();
            },
            trailing: IconButton(
              onPressed: () {
                themeProviderNotifier.toggleTheme();
              },
              icon: Icon(
                isDarkModeEnabled ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ),
          _creatServices(),
          _customListTile(
            Icon(Icons.lock, size: 30),
            'Cerrar sesión',
            () {
              context.go('/');
            },
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }

  Widget _createProfile(BuildContext context) {
    final prefs = UserPreferences();
    final query = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FadeInImage(
              width: query.width * 0.18,
              height: query.width * 0.18,
              placeholder: AssetImage('loading.gif'),
              image: AssetImage('assets/publicidad.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '${prefs.name}'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget _customListTile(
    Widget leadingIcon,
    String title,
    void Function() funtion, {
    Widget? trailing,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          onTap: () {
            funtion();
          },
          leading: leadingIcon,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          trailing: trailing),
    );
  }

  Widget _creatServices() {
    return Expanded(
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        childAspectRatio: 2.5,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
        ],
      ),
    );
  }

  Widget _createCateGory() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.ac_unit,
              size: 30,
              color: Colors.green,
            ),
          ),
          Text('Consulta', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
