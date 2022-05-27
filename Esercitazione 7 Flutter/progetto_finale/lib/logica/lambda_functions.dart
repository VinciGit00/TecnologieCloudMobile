import 'package:progetto_finale/main.dart';
import 'package:progetto_finale/models/tile_categoria_model.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import 'package:http/http.dart' as http;
import 'package:progetto_finale/models/tile_giocatore_model.dart';
import 'package:progetto_finale/models/tile_griglia_partenza.dart';
import 'dart:convert';
import '../models/tile_club_model.dart';

class LambdaFunctions {
  // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Funzione che ritorna la lista di tutte le gare attive al momento
  ///
  Future<List<TileGaraModel>> listraces() async {
    List<TileGaraModel> listaGare = [];

    final response = await http.get(
      Uri.parse("https://da9s2h285g.execute-api.us-east-1.amazonaws.com/test/list_races"),
    );

    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> listaGareJson = jsonDecode(response.body)["result"];

      // controllo se è il primo fetch che faccio per quella lista
      var isListaGareOldEmpty = listaGareOld.isEmpty;
      for (Map<String, dynamic> i in listaGareJson) {
        print(i);
        var model = TileGaraModel.fromJson(i);
        listaGare.add(model);

        // controllo per ciascuna gara presa dal fetch se è nuova oppure era già stata presa da un fetch precedente
        if (listaGareOld.contains(model.id)) {
          model.isNew = false;
        } else {
          // se la entry è nuova, controllo se questo è il primo fetch, se lo è non coloro di giallo le nuove tile
          if (!isListaGareOldEmpty) {
            model.isNew = true;
          }
          // aggiungo le nuove gare alla lista delle vecchie
          listaGareOld.add(model.id);
        }
      }

      return listaGare;
    } else {
      print("ERRORE GET LIST RACES");
      return [];
    }
  }

  // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Funzione che ritorna la lista di tutte le categorie di una gara
  ///
  Future<List<TileCategoriaModel>> listClasses(String idGara) async {
    List<TileCategoriaModel> listaCategorie = [];
    var uri = Uri.https("v5fiq86rb3.execute-api.us-east-1.amazonaws.com", "/list_classes", {'id': idGara});

    final response = await http.get(uri);

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic>? categoriaJson = jsonDecode(response.body);

      var keyList = categoriaJson!.keys.toList();

      var isListaCategoriaOldEmpty = listaCategorieOld.isEmpty;
      keyList.forEach((element) {
        if (categoriaJson[element] == null) {
          return;
        }
        var model = TileCategoriaModel.fromJson(categoriaJson[element]);
        listaCategorie.add(model);

        // controllo per ciascuna gara presa dal fetch se è nuova oppure era già stata presa da un fetch precedente
        if (listaCategorieOld.contains(model.idCategoria)) {
          model.isNew = false;
        } else {
          // se la entry è nuova, controllo se la lista iniziale è vuota, se lo è non coloro di giallo le nuove tile
          if (!isListaCategoriaOldEmpty) {
            model.isNew = true;
          }
          // aggiungo le nuove gare alla lista delle vecchie
          listaCategorieOld.add(model.idCategoria);
        }
      });

      return listaCategorie;
    } else {
      print("ERRORE GET LIST CATEOGORIA");
      return [];
    }
  }

  // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Funzione che ritorna la lista di tutti i club di una gara
  ///
  Future<List<TileClubModel>> listClubs(String idGara) async {
    List<TileClubModel> listaClub = [];
    final uri = await Uri.https("u4wfd8jmi1.execute-api.us-east-1.amazonaws.com", "/listOrg", {"id": idGara});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic>? clubJson = jsonDecode(response.body);

      var keyList = clubJson!.keys.toList();

      var isListaClubOldEmpty = listaClubOld.isEmpty;
      keyList.forEach((element) {
        // eseguo dei controlli sul numero di chiavi del json
        if (clubJson[element] == null) {
          return;
        }

        var model = TileClubModel.fromJson(clubJson[element]!);

        listaClub.add(model);

        if (listaClubOld.contains(model.idClub)) {
          model.isNew = false;
        } else {
          // se la entry è nuova, controllo se la lista iniziale è vuota, se lo è non coloro di giallo le nuove tile
          if (!isListaClubOldEmpty) {
            model.isNew = true;
          }
          // aggiungo le nuove gare alla lista delle vecchie
          listaClubOld.add(model.idClub);
        }
      });

      return listaClub;
    } else {
      print("ERRORE GET LIST CLUBS");
      return [];
    }
  }

  // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Ritorna classifica dei partecipanti appartenenti ad un club o ad una categoria.
  ///
  /// Il parametro [id] serve a specificare la categoria o club di cui si vogliono i risultati.
  ///
  /// Il parametro [isCategoria] serve a indicare se il risultato è nella lista categoria (true)
  /// o in quella dei club (false).
  ///
  Future<List<TileGiocatoreModel>> listResults(String idGara, String id, bool isCategoria) async {
    List<TileGiocatoreModel> listaRisultati = [];
    var uri;

    // Controllo se voglio i risultati per categoria o per club
    if (isCategoria) {
      uri = Uri.https("ru4hppmqxg.execute-api.us-east-1.amazonaws.com", "/results", {"id": idGara, "class": id});
    } else {
      uri = Uri.https("prqldktz2g.execute-api.us-east-1.amazonaws.com", "/lambdaBONUS", {"id": idGara, "organisation": id});
    }

    final response = await http.get(uri);
    print(id);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic>? risultatiJson = jsonDecode(response.body);

      var keyList = risultatiJson!.keys.toList();

      var isListaGiocatoriOldEmpty = listaGiocatoriOld.isEmpty;

      keyList.forEach((element) {
        if (risultatiJson[element] == null) {
          return;
        }

        var model = TileGiocatoreModel.fromJson(risultatiJson[element], isCategoria);
        listaRisultati.add(model);

        if (listaGiocatoriOld.contains(model.idGiocatore)) {
          model.isNew = false;
        } else {
          // se la entry è nuova, controllo se la lista iniziale è vuota, se lo è non coloro di giallo le nuove tile
          if (!isListaGiocatoriOldEmpty) {
            model.isNew = true;
          }
          // aggiungo le nuove gare alla lista delle vecchie
          listaGiocatoriOld.add(model.idGiocatore!);
        }
      });

      return listaRisultati;
    } else {
      print("ERRORE GET LIST RESULTS");
      return [];
    }
  }

  // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Funzione che ritorna la griglia di partenza per una specifica categoria
  ///
  Future<List<TileGrigliaPartenzaModel>> listaGrigliaPartenza(String idCategoria) async {
    List<TileGrigliaPartenzaModel> listaGrigliaPartenza = [];
    // In questo caso il nome categoria è hardcoded perchè nell'xml non sono presenti risultati
    // per tutte le categorie ma solo per una. (nella realtà si andrebbe a prendere il nome della categoria in questione)
    final uri = await Uri.https("", "/", {"class": "Men Elite"});

    final response = await http.get(uri);

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic>? grigliaPartenzaJson = jsonDecode(response.body);

      var keyList = grigliaPartenzaJson!.keys.toList();

      keyList.forEach((element) {
        // eseguo dei controlli sul numero di chiavi del json
        if (grigliaPartenzaJson[element] == null) {
          return;
        }

        var model = TileGrigliaPartenzaModel.fromJson(grigliaPartenzaJson[element]!);
        listaGrigliaPartenza.add(model);
      });

      return listaGrigliaPartenza;
    } else {
      print("ERRORE GET LIST CLUBS");
      return [];
    }
  }
}
