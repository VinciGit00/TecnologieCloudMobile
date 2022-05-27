class TileClubModel {
  final String nomeClub;
  final String nazione;
  final String idClub;
  late bool isNew;

  TileClubModel({
    required this.nazione,
    this.isNew = false,
    required this.idClub,
    required this.nomeClub,
  });

  factory TileClubModel.fromJson(Map<String, dynamic> json, {bool isNew = false}) {
    return TileClubModel(
      nomeClub: json["name"],
      nazione: json["country"],
      idClub: json["id"],
      isNew: isNew,
    );
  }
}
