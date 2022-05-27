class TileGaraModel {
  final String title;
  final String data;
  final String ora;
  final String id;
  late bool isNew;

  TileGaraModel({required this.data, required this.id, this.isNew = false, required this.ora, required this.title});

  factory TileGaraModel.fromJson(Map<String, dynamic> json, {bool isNew = false}) {
    return TileGaraModel(
      data: json["race_date"],
      ora: "orario",
      id: json["race_id"],
      title: json["race_name"],
      isNew: isNew,
    );
  }
}
