class TileGaraModel {
  final String title;
  final String data;
  final String id;
  final String luogo;
  final String ora;
  late bool isNew;

  TileGaraModel({
    required this.data,
    required this.id,
    this.isNew = false,
    required this.title,
    required this.luogo,
    required this.ora,
  });

  factory TileGaraModel.fromJson(Map<String, dynamic> json, {bool isNew = false}) {
    return TileGaraModel(
      data: json["race_date"],
      id: json["race_id"],
      title: json["nome_gara"],
      ora: json["orario"],
      luogo: json["posto"],
      isNew: isNew,
    );
  }
}
