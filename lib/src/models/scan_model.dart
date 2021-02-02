import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int _id;
  String _tipo;
  String _valor;

  ScanModel({
    int id,
    String tipo,
    @required String valor,
  })  : this._id = id,
        this._tipo = valor.contains('http') ? 'http' : 'geo',
        this._valor = valor;

  set id(int id) => this._id = id;
  int get id => this._id;

  set tipo(String valor) =>
      this._tipo = valor.contains('http') ? 'http' : 'geo';
  String get tipo => this._tipo;

  set valor(String valor) => this._valor = valor;
  String get valor => this._valor;

  LatLng getLatLng() {
    List<String> latlng = this._valor.substring(4).split(',');
    double lat = double.parse(latlng[0]);
    double lng = double.parse(latlng[1]);
    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"] == null ? null : json["id"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        valor: json["valor"] == null ? null : json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id == null ? null : _id,
        "tipo": _tipo == null ? null : _tipo,
        "valor": _valor == null ? null : _valor,
      };
}
