import 'package:progetto_finale/models/tile_gara_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Funzione che ritorna la lista di tutte le gare attive al momento
///
class LambdaFunctions {
  Future<List<TileGaraModel>> listraces() async {
    List<TileGaraModel> listaGare = [];

    final response = await http.get(Uri.parse(
        "https://da9s2h285g.execute-api.us-east-1.amazonaws.com/test/list_races"));

    print(response.statusCode);

    if (response.statusCode == 200) {
      List<dynamic> listaGareJson = jsonDecode(response.body)["result"];

      print(listaGareJson.length);

      for (Map<String, dynamic> i in listaGareJson) {
        print(i);
        listaGare.add(TileGaraModel.fromJson(i));
      }

      print(listaGare);
      return listaGare;
    } else {
      throw Exception("Failed List Races");
    }
  }
}
