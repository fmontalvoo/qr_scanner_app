import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_scanner_app/src/models/scan_model.dart';

import 'package:qr_scanner_app/src/providers/scans_provider.dart';
import 'package:qr_scanner_app/src/utils/utils.dart';

class ScansList extends StatelessWidget {
  final IconData icon;

  ScansList({this.icon});
  @override
  Widget build(BuildContext context) {
    final scansProvider = Provider.of<ScansProvider>(context);
    final scans = scansProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        child: _item(context, scans, i),
        onDismissed: (direction) {
          scansProvider.eliminar(scans[i].id);
        },
      ),
    );
  }

  ListTile _item(BuildContext context, List<ScanModel> scans, int i) {
    return ListTile(
      leading: Icon(
        this.icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(scans[i].valor),
      subtitle: Text(scans[i].id.toString()),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
      onTap: () => launchURL(context, scans[i]),
    );
  }
}
