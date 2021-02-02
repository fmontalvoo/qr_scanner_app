import 'package:flutter/material.dart';

import 'package:qr_scanner_app/src/widgets/scans_list.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScansList(icon: Icons.map);
  }
}
