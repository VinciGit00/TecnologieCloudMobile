import 'package:flutter/material.dart';
import 'package:progetto_finale/models/tile_giocatore_model.dart';
import 'package:progetto_finale/tiles/tile_giocatore.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';
import '../logica/lambda_functions.dart';

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
        ),
        body:
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
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
