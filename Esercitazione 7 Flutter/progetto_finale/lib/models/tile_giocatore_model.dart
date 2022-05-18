class TileGiocatoreModel {
  final String nomeGiocatore;
  final String? nomeClub;
  final String? nomeCategoria;
  final String idGiocatore;
  final String status;
  final String nazione;
  final String score;
  final String time;
  final String rank;
  final String numeroMaglia;

  TileGiocatoreModel(
      {this.nomeCategoria,
      this.nomeClub,
      required this.nomeGiocatore,
      required this.idGiocatore,
      required this.numeroMaglia,
      required this.status,
      required this.score,
      required this.nazione,
      required this.time,
      required this.rank});

  /// Parser da json a oggetto dart
  ///
  /// Il parametro [isCategoria] serve a indicare se il risultato è nella lista categoria (true)
  /// o in quella dei club (false)
  ///
  factory TileGiocatoreModel.fromJson(
      Map<String, dynamic> json, bool isCategoria) {
    return TileGiocatoreModel(
        nomeCategoria: isCategoria ? json["category"] : null,
        nomeClub: isCategoria ? null : json[""],
        nomeGiocatore: json["name"],
        idGiocatore: json["id"],
        status: json["status"],
        score: json["score"],
        time: json["time"],
        nazione: json["nat"],
        numeroMaglia: json["bib"],
        rank: json["position"]);
  }
}
