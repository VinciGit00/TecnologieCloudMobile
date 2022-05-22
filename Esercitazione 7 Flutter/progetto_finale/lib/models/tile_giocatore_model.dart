class TileGiocatoreModel {
  final String? nomeGiocatore;
  final String? nomeClub;
  final String? nomeCategoria;
  final String? idGiocatore;
  final String? status;
  final String? timeBehind;
  final String? nazione;
  final String? score;
  final String? time;
  final int? rank;
  final String? numeroMaglia;

  TileGiocatoreModel(
      {this.nomeCategoria,
      this.nomeClub,
      this.nomeGiocatore,
      this.idGiocatore,
      this.timeBehind,
      this.numeroMaglia,
      this.status,
      this.score,
      this.nazione,
      this.time,
      this.rank});

  /// Parser da json a oggetto dart
  ///
  /// Il parametro [isCategoria] serve a indicare se il risultato è nella lista categoria (true)
  /// o in quella dei club (false)
  ///
  factory TileGiocatoreModel.fromJson(Map<String, dynamic> json, bool isCategoria) {
    return TileGiocatoreModel(
      nomeCategoria: isCategoria ? null : json["category"],
      nomeClub: isCategoria ? json["club_name"] : null,
      nomeGiocatore: json["name"],
      idGiocatore: json["id"],
      status: json["status"],
      score: json["score"],
      //time: json["time"],
      time: null,
      timeBehind: null,
      nazione: json["nat"],
      numeroMaglia: json["bib"],
      rank: json["position"],
    );
  }
}
