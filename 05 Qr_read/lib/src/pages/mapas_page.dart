import 'package:flutter/material.dart';
import 'package:qr_read/src/block/scan_bloc.dart';
import 'package:qr_read/src/models/scan_model.dart';

class MapasPage extends StatelessWidget {
  final scansBloc = ScansBloc();

  get utils => null;
  @override
  Widget build(BuildContext context) {
    scansBloc.obtenerScans();

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scans = snapshot.data;

        if (scans!.length == 0) {
          return Text('No hay Info');
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) => scansBloc.borrarScan(scans[i].id!),
            child: ListTile(
              leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text("ID : ${scans[i].id.toString()}"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => {
                utils.openScan(context, scans[i]),
              },
            ),
          ),
        );
      },
    );
  }
}
