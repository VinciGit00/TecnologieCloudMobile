import 'package:progetto_finale/models/tile_categoria_model.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/tile_club_model.dart';

class LambdaFunctions {
  /// Funzione che ritorna la lista di tutte le gare attive al momento
  ///
  Future<List<TileGaraModel>> listraces() async {
    List<TileGaraModel> listaGare = [];

    final response = await http.get(Uri.parse(
        "https://da9s2h285g.execute-api.us-east-1.amazonaws.com/test/list_races"));

    if (response.statusCode == 200) {
      List<dynamic> listaGareJson = jsonDecode(response.body)["result"];

      for (Map<String, dynamic> i in listaGareJson) {
        listaGare.add(TileGaraModel.fromJson(i));
      }

      return listaGare;
    } else {
      print("ERRORE GET LIST RACES");
      return [];
    }
  }

  /// Funzione che ritorna la lista di tutte le categorie di una gara
  ///
  Future<List<TileCategoriaModel>> listClasses(String idGara) async {
    List<TileCategoriaModel> listaCategorie = [];

    var uri = Uri.https("v5fiq86rb3.execute-api.us-east-1.amazonaws.com",
        "/list_classes", {'id': idGara});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> listaCategorieJson = jsonDecode(response.body)["result"];

      for (Map<String, dynamic> i in listaCategorieJson) {
        listaCategorie.add(TileCategoriaModel.fromJson(i));
      }

      return listaCategorie;
    } else {
      print("ERRORE GET LIST CATEGORIES");
      return [];
    }
  }

  /// Funzione che ritorna la lista di tutti i club di una gara
  ///
  Future<List<TileClubModel>> listClubs(String idGara, String idClub) async {
    List<TileClubModel> listaClub = [];
    final uri = await Uri.http("prqldktz2g.execute-api.us-east-1.amazonaws.com",
        "/lambdaBONUS", {"id": idGara, "organization": idClub});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> listaClubJson = jsonDecode(response.body)["result"];

      for (Map<String, dynamic> i in listaClubJson) {
        listaClub.add(TileClubModel.fromJson(i));
      }

      return listaClub;
    } else {
      print("ERRORE GET LIST CLUBS");
      return [];
    }
  }
}
