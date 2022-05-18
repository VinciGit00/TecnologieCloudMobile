class TileGiocatoreModel {
  final String nomeGiocatore;
  final String nomeClub;
  final String idGiocatore;
  final String status;
  final String nazione;
  final String score;
  final String time;

  TileGiocatoreModel({
    required this.nomeClub,
    required this.nomeGiocatore,
    required this.idGiocatore,
    required this.status,
    required this.score,
    required this.nazione,
    required this.time,
  });

  factory TileGiocatoreModel.fromJson(Map<String, dynamic> json) {
    return TileGiocatoreModel(
      nomeClub: json[""],
      nomeGiocatore: json[""],
      idGiocatore: json[""],
      status: json[""],
      score: json[""],
      time: json[""],
      nazione: json[""],
    );
  }
}
