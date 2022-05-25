import 'package:flutter/material.dart';
import 'package:progetto_finale/main.dart';
import 'package:progetto_finale/models/tile_giocatore_model.dart';
import 'package:progetto_finale/tiles/tile_giocatore.dart';
import '../logica/lambda_functions.dart';

/// Questa pagina mostra una classifica dei giocatori.
///
/// Questa pagina viene usata sia per mostrare la classifica dei giocatori per club
/// sia la classifica dei giocatori per una ceerta categoria (di una certa gara).
///
class PaginaClassificaGiocatori extends StatefulWidget {
  PaginaClassificaGiocatori({Key? key, required this.title, required this.isCategoria, required this.idGara, required this.id}) : super(key: key);

  final String title;
  // Indico se sto mostrando la lista di giocatori della categoria indicata (true) oppure
  // del club indicato (false)
  final bool isCategoria;

  // id della categoria o del club
  final String id;

  final String idGara;

  @override
  State<PaginaClassificaGiocatori> createState() => _PaginaClassificaGiocatori();
}

class _PaginaClassificaGiocatori extends State<PaginaClassificaGiocatori> {
  // pulisco lista giocatori old ogni volta che vado a visualizzare una  lista di risultati per categoria o club
  // in questo modo nella lista giocatori old ho solo quelli inerenti a quel contesto e non anche quelli di altri club o categorie
  @override
  void initState() {
    listaGiocatoriOld.clear();
    super.initState();
  }

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
            // Classifica Giocatori
            FutureBuilder<List<TileGiocatoreModel>>(
          future: LambdaFunctions().listResults(widget.idGara, widget.id, widget.isCategoria),
          builder: (context, asyncsnapshot) {
            if (asyncsnapshot.connectionState == ConnectionState.done) {
              if (asyncsnapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                  },
                  child: ListView.builder(
                    itemCount: asyncsnapshot.data!.length,
                    itemBuilder: (context, index) {
                      return TileGiocatore(
                        model: asyncsnapshot.data![index],
                        isCategoria: widget.isCategoria,
                      );
                    },
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
        ),
      ),
    );
  }
}
