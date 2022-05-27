class TileGrigliaPartenzaModel {
  final String nomeGiocatore;
  final String nazione;
  final String club;
  final String istantePartenza;
  final String numeroMaglia;

  TileGrigliaPartenzaModel({
    required this.nazione,
    required this.club,
    required this.nomeGiocatore,
    required this.istantePartenza,
    required this.numeroMaglia,
  });

  factory TileGrigliaPartenzaModel.fromJson(Map<String, dynamic> json) {
    return TileGrigliaPartenzaModel(
      istantePartenza: json["start"],
      nomeGiocatore: json["name"],
      numeroMaglia: json["bib"],
      nazione: json["country"],
      club: json["org"],
    );
  }
}
