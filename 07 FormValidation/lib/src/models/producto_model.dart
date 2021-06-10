// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  ProductoModel({
    this.id = "1",
    this.titulo = '',
    this.valor = 0,
    this.disponible = true,
    this.fotoUrl = '',
  });

  String id;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        titulo: json["titulo"],
        valor: json["valor"].toDouble(),
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
      };
}
