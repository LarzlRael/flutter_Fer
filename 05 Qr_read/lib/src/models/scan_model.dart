class ScanModel {
  int? id;
  String? tipo;
  String valor;

  ScanModel({
    required id,
    required this.valor,
    tipo,
  }) {
    this.id = id;
    if (valor.contains('http')) {
      this.tipo = 'http';
    } else {
      this.tipo = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json["id"],
      tipo: json["tipo"],
      valor: json["valor"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}

class Arguments {
  final int id;
  final String valor;

  Arguments(
    this.id,
    this.valor,
  );
}
