import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_read/src/models/scan_model.dart';

import 'package:latlong2/latlong.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final MapController map = MapController();
  String tipoMapa = 'streets';
  @override
  Widget build(BuildContext context) {
    final Arguments arguments =
        ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordernada QR'),
        actions: [
          IconButton(
              onPressed: () {
                map.move(getLatLng(arguments.valor), 15);
              },
              icon: Icon(Icons.my_location)),
        ],
      ),
      body: _crearFlutterMap(arguments),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        if (tipoMapa == 'streets') {
          tipoMapa = 'dark';
        } else if (tipoMapa == 'ligth') {
          tipoMapa = 'outdoors';
        } else if (tipoMapa == 'outdoors') {
          tipoMapa = 'satellite';
        } else {
          tipoMapa = 'streets';
        }
        setState(() {});
      },
    );
  }

  _crearFlutterMap(Arguments arguments) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: getLatLng(arguments.valor),
        zoom: 10,
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(arguments),
      ],
    );
  }

  LatLng getLatLng(String value) {
    final lalo = value.substring(4).split(',');
    final lat = double.parse(lalo[0]);
    final lng = double.parse(lalo[1]);

    print('$lat $lng');
    return LatLng(lat, lng);
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate:
            'https://api.mapbox.com/styles/v1/larzdosan/ckpk8cp380yqo17o9xx18ikvp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGFyemRvc2FuIiwiYSI6ImNrN3l6YWhrODAweXgzbm1xZHVpNnZoanEifQ.khjLBBEikbWK6xN23SswFg',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoibGFyemRvc2FuIiwiYSI6ImNrN3l6YWhrODAweXgzbm1xZHVpNnZoanEifQ.khjLBBEikbWK6xN23SswFg',
          'id': 'mapbox.country-boundaries-v1'
        });
  }

  _crearMarcadores(Arguments arguments) {
    return MarkerLayerOptions(markers: [
      Marker(
        width: 100.0,
        height: 100.0,
        point: getLatLng(arguments.valor),
        builder: (context) => Container(
          child: Icon(
            Icons.location_on,
            size: 70.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ]);
  }
}
