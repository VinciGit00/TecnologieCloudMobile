class TileCategoriaModel {
  final String nomeCategoria;
  final String dislivello;
  final String distanza;

  TileCategoriaModel({
    required this.nomeCategoria,
    required this.dislivello,
    required this.distanza,
  });

  factory TileCategoriaModel.fromJson(Map<String, dynamic> json) {
    return TileCategoriaModel(
      nomeCategoria: json[""],
      dislivello: "",
      distanza: json[""],
    );
  }
}
