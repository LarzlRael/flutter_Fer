part of 'pages.dart';

class NavigationBottom extends StatefulWidget {
  @override
  _NavigationBottomState createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigatorBar(context),
      /* bottomNavigationBar: _bottomNavigatorBar2(context), */
    );
  }

  _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return TarjetaPage();
      case 1:
        return OperacionesPage();
      case 2:
        return Pagos();
      case 3:
        return UserPage();
      case 4:
        return UserPage();
    }
  }

  _bottomNavigatorBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.pinkAccent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(
            0xff734583,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          unselectedIconTheme: IconThemeData(
            size: 16,
          ),
          selectedIconTheme: IconThemeData(
            size: 18,
          ),
          elevation: 1,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_outlined), label: 'Operaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pagos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.key_outlined), label: 'Operaciones BNB'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'usuario'),
        ],
      ),
    );
  }
}
