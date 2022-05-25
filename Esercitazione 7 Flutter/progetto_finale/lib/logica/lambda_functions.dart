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

    final response = await http.get(Uri.parse("https://da9s2h285g.execute-api.us-east-1.amazonaws.com/test/list_races"));

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

  // TODO OTTIMIZZARE CODICE
  /// Funzione che ritorna la lista di tutte le categorie di una gara
  ///
  Future<List<TileCategoriaModel>> listClasses(String idGara) async {
    List<TileCategoriaModel> listaCategorie = [];
    var uri = Uri.https("v5fiq86rb3.execute-api.us-east-1.amazonaws.com", "/list_classes", {'id': idGara});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      Map<String, dynamic>? categoriaJson = jsonDecode(response.body);

      var keyList = categoriaJson!.keys.toList();

      keyList.forEach((element) {
        if (categoriaJson[element] == null) {
          return;
        }
        listaCategorie.add(
          TileCategoriaModel.fromJson(categoriaJson[element]),
        );
      });

      return listaCategorie;
    } else {
      print("ERRORE GET LIST CATEOGORIA");
      return [];
    }
  }

  /// Funzione che ritorna la lista di tutti i club di una gara
  ///
  Future<List<TileClubModel>> listClubs(String idGara) async {
    List<TileClubModel> listaClub = [];
    final uri = await Uri.https("u4wfd8jmi1.execute-api.us-east-1.amazonaws.com", "/listOrg", {"id": idGara});

    final response = await http.get(uri);

    // TODO OTTIMIZZARE CODICE
    if (response.statusCode == 200) {
      Map<String, dynamic>? clubJson = jsonDecode(response.body);

      var keyList = clubJson!.keys.toList();

      keyList.forEach((element) {
        if (clubJson[element] == null) {
          return;
        }
        listaClub.add(
          TileClubModel.fromJson(clubJson[element]),
        );
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
  Future<List<TileGiocatoreModel>> listResults(String idGara, String id, bool isCategoria) async {
    List<TileGiocatoreModel> listaRisultati = [];
    var uri;

    print("CLUB: " + id);
    print("GARA: " + idGara);
    print(isCategoria);

    // Controllo se voglio i risultati per categoria o per club
    if (isCategoria) {
      uri = Uri.https("ru4hppmqxg.execute-api.us-east-1.amazonaws.com", "/results", {"id": idGara, "class": id});
    } else {
      uri = Uri.https("prqldktz2g.execute-api.us-east-1.amazonaws.com", "/lambdaBONUS", {"id": idGara, "organisation": id});
    }

    final response = await http.get(uri);

    print(response.body);

    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      Map<String, dynamic>? risultatiJson = jsonDecode(response.body);

      var keyList = risultatiJson!.keys.toList();
      print(keyList.length);

      keyList.forEach((element) {
        print("IJIJ");
        if (risultatiJson[element] == null) {
          return;
        }
        listaRisultati.add(
          TileGiocatoreModel.fromJson(risultatiJson[element], isCategoria),
        );
        print("CIOC");
      });

      print(listaRisultati.length);
      return listaRisultati;
    } else {
      print("ERRORE GET LIST CLUBS");
      return [];
    }
  }
}
