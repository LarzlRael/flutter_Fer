part of 'widgets.dart';

class GridOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createOperationTables(),
    );
  }
}

Widget _createOperationTables() {
  return GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20),
    crossAxisCount: 2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    children: [
      _createCard(Icons.money_outlined, "Transferir"),
      _createCard(Icons.card_giftcard, "Tarjeta de debito"),
      _createCard(Icons.transform_sharp, "Transacciones"),
      _createCard(Icons.night_shelter_outlined, "Transacciones"),
      _createCard(Icons.handyman_rounded, "Solicitudes en linea"),
      _createCard(Icons.class_outlined, "solicitud"),
      _createCard(Icons.card_giftcard, "Tarjeta de debito"),
      _createCard(Icons.transform_sharp, "Transacciones"),
    ],
  );
}

Widget _createCard(IconData icon, String label) {
  return Container(
    height: 500,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Colors.green),
        SizedBox(height: 10),
        Text(label,
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center),
      ],
    ),
  );
}
