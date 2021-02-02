import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:qr_scanner_app/src/models/scan_model.dart';

launchURL(BuildContext context, ScanModel scanModel) async {
  final url = scanModel.valor;
  if (scanModel.tipo.compareTo('http') == 0) {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scanModel);
  }
}
