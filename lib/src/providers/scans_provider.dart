import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:qr_scanner_app/src/providers/db_provider.dart';

class ScansProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String currentType = 'http';

  Future<ScanModel> crear(String valor) async {
    final scan = ScanModel(valor: valor);
    final id = await DBProvider.db.create(scan);
    scan.id = id;
    if (this.currentType.compareTo(scan.tipo) == 0) {
      this.scans.add(scan);
      notifyListeners();
    }
    return scan;
  }

  void cargarScans() async {
    final scans = await DBProvider.db.getScans();
    this.scans = [...scans];
    notifyListeners();
  }

  void cargarScansPorTipo(String tipo) async {
    this.currentType = tipo;
    final scans = await DBProvider.db.readByType(this.currentType);
    this.scans = [...scans];
    notifyListeners();
  }

  void eliminar(int id) async {
    await DBProvider.db.delete(id);
    // this.cargarScansPorTipo(this.currentType);
  }

  void eliminarScans() async {
    await DBProvider.db.deleteScans();
    this.scans = [];
    notifyListeners();
  }
}
