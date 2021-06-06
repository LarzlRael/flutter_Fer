import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_read/src/block/scan_bloc.dart';
import 'package:qr_read/src/models/scan_model.dart';
import 'package:qr_read/src/pages/direcciones_page.dart';
import 'package:qr_read/src/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  final scansBloc = ScansBloc();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final scansBloc = ScansBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarAllScans,
          )
        ],
      ),
      bottomNavigationBar: _createBotomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQr(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _createBotomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          label: 'Direcciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Maps',
        ),
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }

  _scanQr(BuildContext context) async {
    // https://fernando-herrera.com
    // geo: 16.4958412,-68.1363431,18
    String futereString = 'https://fernando-herrera.com/';
    /*   try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "canel", false, ScanMode.DEFAULT);
    } catch (e) {
      barcodeScanRes = e.toString();
    }

    print('futereString : $barcodeScanRes');

    */
    Random random = new Random();
    int randomNumber1 = random.nextInt(100000).toInt();
    int randomNumber2 = random.nextInt(100000).toInt();

    if (futereString != null) {
      final scan = ScanModel(id: randomNumber1, valor: futereString);
      scansBloc.agregarScan(scan);
      final scan2 =
          ScanModel(id: randomNumber2, valor: 'geo:-16.4958412,-68.1363431,18');
      scansBloc.agregarScan(scan2);
    }
  }
}
