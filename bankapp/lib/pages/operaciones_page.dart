part of 'pages.dart';

class OperacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Operaciones',
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
        /* child: Text('Hola mundo'), */
        child: GridOptions(),
      ),
    );
  }
}
