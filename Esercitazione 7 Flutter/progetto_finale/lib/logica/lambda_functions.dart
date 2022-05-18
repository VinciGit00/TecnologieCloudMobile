import 'package:progetto_finale/models/tile_categoria_model.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import 'package:http/http.dart' as http;
import 'package:progetto_finale/models/tile_giocatore_model.dart';
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

    print("/////////////////////////////");
    print(jsonDecode(response.body));
    print("/////////////////////////////");

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

  /// TODO  FIXARE ELABORAZIONE BODY RICHIESTA, NON  E' UNA LISTA MA UNA MAPPA!!!
  /// Funzione che ritorna la lista di tutti i club di una gara
  ///
  Future<List<TileClubModel>> listClubs(String idGara) async {
    List<TileClubModel> listaClub = [];
    final uri = await Uri.https(
        "u4wfd8jmi1.execute-api.us-east-1.amazonaws.com",
        "/listOrg",
        {"id": idGara});

    final response = await http.get(uri);

    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      Map<String, dynamic> clubJson = jsonDecode(response.body)["result"];

      clubJson.map((key, value) {
        listaClub.add(TileClubModel.fromJson(value));
        return MapEntry(key, value);
      });

      return listaClub;
    } else {
      print("ERRORE GET LIST CLUBS");
      return [];
    }
  }

  /// Ritorna lista dei partecipanti ad un club o ad una categoria.
  ///
  /// Il parametro [id] serve a specificare la categoria o club di cui si vogliono i risultati.
  ///
  /// Il parametro [isCategoria] serve a indicare se il risultato è nella lista categoria (true)
  /// o in quella dei club (false).
  ///
  Future<List<TileGiocatoreModel>> listResults(
      String idGara, String id, bool isCategoria) async {
    List<TileGiocatoreModel> listaRisultati = [];
    var uri;

    // Controllo se voglio i risultati per categoria o per club
    if (isCategoria) {
      uri = await Uri.http("ru4hppmqxg.execute-api.us-east-1.amazonaws.com",
          "/results", {"id": idGara, "class": id});
    } else {
      uri = await Uri.http(
          "u4wfd8jmi1.execute-api.us-east-1.amazonaws.com", "/listOrg", {});
    }

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> listaRisultatiJson = jsonDecode(response.body)["result"];

      for (Map<String, dynamic> i in listaRisultatiJson) {
        listaRisultati.add(TileGiocatoreModel.fromJson(i, isCategoria));
      }
      return listaRisultati;
    } else {
      print("ERRORE GET LIST GIOCATORI");
      return [];
    }
  }
}
