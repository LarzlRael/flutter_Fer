part of 'pages.dart';

class Pagos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pagos",
          style: TextStyle(
            color: Color(0xff734583),
          ),
        ),
      ),
      body: GridOptions(),
    );
  }
}
