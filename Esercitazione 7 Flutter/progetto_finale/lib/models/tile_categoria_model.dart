class TileCategoriaModel {
  final String nomeCategoria;
  final String dislivello;
  final String distanza;
  final String idCategoria;

  TileCategoriaModel({
    required this.nomeCategoria,
    required this.dislivello,
    required this.distanza,
    required this.idCategoria,
  });

  factory TileCategoriaModel.fromJson(Map<String, dynamic> json) {
    return TileCategoriaModel(
        nomeCategoria: json[""],
        dislivello: "",
        distanza: json[""],
        idCategoria: json[""]);
  }
}
