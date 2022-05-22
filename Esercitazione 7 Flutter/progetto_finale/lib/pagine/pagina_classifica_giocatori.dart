import 'package:flutter/material.dart';
import 'package:progetto_finale/models/tile_giocatore_model.dart';
import 'package:progetto_finale/tiles/tile_giocatore.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';
import '../logica/lambda_functions.dart';

/// Questa pagina mostra una classifica dei giocatori.
///
/// Questa pagina viene usata sia per mostrare la classifica dei giocatori per club
/// sia la classifica dei giocatori per una ceerta categoria (di una certa gara).
///
class PaginaClassificaGiocatori extends StatefulWidget {
  PaginaClassificaGiocatori(
      {Key? key,
      required this.title,
      required this.isCategoria,
      required this.id})
      : super(key: key);

  final String title;
  // Indico se sto mostrando la lista di giocatori della categoria indicata (true) oppure
  // del club indicato (false)
  final bool isCategoria;
  // id della categoria o del club
  final String id;

  @override
  State<PaginaClassificaGiocatori> createState() =>
      _PaginaClassificaGiocatori();
}

class _PaginaClassificaGiocatori extends State<PaginaClassificaGiocatori> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body:
<<<<<<< Updated upstream
            // Classifica Giocatori
            FutureBuilder<List<TileGiocatoreModel>>(
          future: LambdaFunctions()
              .listResults(widget.title, widget.id, widget.isCategoria),
          builder: (context, asyncsnapshot) {
            if (asyncsnapshot.connectionState == ConnectionState.done) {
              if (asyncsnapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: () => Future.delayed(
                    const Duration(seconds: 1),
                  ),
                  child: ListView.builder(
                    itemCount: asyncsnapshot.data!.length,
                    itemBuilder: (context, index) => TileGiocatore(
                      model: asyncsnapshot.data![index],
                    ),
                  ),
                );
              }
              return Center(
                child: Text("Nessun Risultato Trovato"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
=======
            // Tab Classifica per Categoria
            RefreshIndicator(
          color: Colors.red,
          onRefresh: () => Future.delayed(const Duration(seconds: 1)),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => TileGiocatore(
              codiceNazione: "ITA",
              idGiocatore: "23423-23423-1232",
              nomeGiocatore: "Piero Paolino",
              score: "100",
              status: "OK",
              time: "00:10:16",
              nomeClub: "Ferrati",
              nomeCategoria: "Nome Prima Categoria",
            ),
          ),
>>>>>>> Stashed changes
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
