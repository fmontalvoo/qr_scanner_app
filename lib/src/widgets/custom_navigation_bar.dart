import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_scanner_app/src/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UIProvider>(context);
    return BottomNavigationBar(
      currentIndex: uiprovider.currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
      ],
      onTap: (index) {
        uiprovider.currentIndex = index;
      },
    );
  }
}
