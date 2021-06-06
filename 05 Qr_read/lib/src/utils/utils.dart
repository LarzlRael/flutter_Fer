import 'package:flutter/material.dart';
import 'package:qr_read/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

openScan(BuildContext context, ScanModel scan) async {
  print(scan.tipo);
  if (scan.tipo == 'https') {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not lauch ${scan.valor}';
    }
  } else {
    final Arguments arguments = Arguments(scan.id!, scan.valor);
    Navigator.pushNamed(
      context,
      'mapa',
      arguments: arguments,
    );
  }
}
