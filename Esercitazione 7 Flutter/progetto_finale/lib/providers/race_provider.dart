import 'package:flutter/cupertino.dart';
import 'package:progetto_finale/models/tile_categoria_model.dart';
import 'package:progetto_finale/models/tile_club_model.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import 'package:progetto_finale/models/tile_giocatore_model.dart';
import 'package:progetto_finale/utils/enums.dart';
import 'package:flutter/material.dart';

class RaceProvider with ChangeNotifier {
  List<TileGaraModel> listaGare = [];

  List<TileCategoriaModel> listaCategorie = [];

  List<TileClubModel> listaClub = [];

  List<TileGiocatoreModel> listaGiocatoriClub = [];

  List<TileGiocatoreModel> listaGiocatoriCategoria = [];

  void updateLista(TipologiaTile tipoTile, List<dynamic> newList) {
    switch (tipoTile) {
      case TipologiaTile.CATEGORIA:
      case TipologiaTile.CLUB:
      case TipologiaTile.GIOCATORE:
      case TipologiaTile.GARA:
    }
  }
}
