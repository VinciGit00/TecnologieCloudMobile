class TileClubModel {
  final String nomeCategoria;
  final String nomeClub;
  final String nazione;
  final String idClub;

  TileClubModel(
      {required this.nomeCategoria,
      required this.nazione,
      required this.idClub,
      required this.nomeClub});

  factory TileClubModel.fromJson(Map<String, dynamic> json) {
    return TileClubModel(
      nomeCategoria: json[""],
      nomeClub: json[""],
      nazione: json[""],
      idClub: json[""],
    );
  }
}
