import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_scanner_app/src/providers/ui_provider.dart';
import 'package:qr_scanner_app/src/providers/scans_provider.dart';

import 'package:qr_scanner_app/src/pages/map_page.dart';
import 'package:qr_scanner_app/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UIProvider(index: 0)),
        ChangeNotifierProvider(create: (_) => ScansProvider()),
      ],
      child: buildMaterialApp(),
    );
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'QR Scanner',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'map': (_) => MapPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
