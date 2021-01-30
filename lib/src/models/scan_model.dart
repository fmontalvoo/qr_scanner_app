import 'dart:convert';

import 'package:meta/meta.dart';

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
        this._tipo = tipo.contains('http') ? 'http' : 'geo',
        this._valor = valor;

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
