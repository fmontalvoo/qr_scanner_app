import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_scanner_app/src/providers/ui_provider.dart';

import 'package:qr_scanner_app/src/pages/maps_page.dart';
import 'package:qr_scanner_app/src/pages/address_page.dart';

import 'package:qr_scanner_app/src/widgets/scan_button.dart';
import 'package:qr_scanner_app/src/widgets/custom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inicio'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UIProvider>(context);
    switch (uiprovider.currentIndex) {
      case 0:
        return MapsPage();
        break;
      case 1:
        return AddressPage();
        break;
      default:
        return Container();
    }
  }
}
