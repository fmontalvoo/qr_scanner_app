import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qr_scanner_app/src/providers/scans_provider.dart';
import 'package:qr_scanner_app/src/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scansProvider = Provider.of<ScansProvider>(context);
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3d8bef', 'Cancelar', false, ScanMode.QR);

        if (barcodeScanRes == '-1') return;

        final scan = await scansProvider.crear(barcodeScanRes);

        launchURL(context, scan);
      },
    );
  }
}
