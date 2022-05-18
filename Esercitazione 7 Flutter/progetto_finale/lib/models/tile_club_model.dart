class TileClubModel {
  final String nomeClub;
  final String nazione;
  final String idClub;

  TileClubModel(
      {required this.nazione, required this.idClub, required this.nomeClub});

  factory TileClubModel.fromJson(Map<String, dynamic> json) {
    return TileClubModel(
      nomeClub: json["name"],
      nazione: json["country"],
      idClub: json["id"],
    );
  }
}
