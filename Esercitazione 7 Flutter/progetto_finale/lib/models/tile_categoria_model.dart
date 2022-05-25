class TileCategoriaModel {
  final String nomeCategoria;
  final String dislivello;
  final String distanza;
  final String idCategoria;
  // indica se l'istanza della tile è appena stata aggiunta ai risultati o era già presente
  late bool isNew;

  TileCategoriaModel({
    required this.nomeCategoria,
    required this.dislivello,
    this.isNew = false,
    required this.distanza,
    required this.idCategoria,
  });

  factory TileCategoriaModel.fromJson(Map<String, dynamic> json, {bool isNew = false}) {
    return TileCategoriaModel(
      nomeCategoria: json["name"],
      dislivello: json["climb"],
      distanza: json["length"],
      idCategoria: json["id"],
      isNew: isNew,
    );
  }
}
