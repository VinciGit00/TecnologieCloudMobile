import 'package:flutter/material.dart';
import 'package:progetto_finale/logica/lambda_functions.dart';
import 'package:progetto_finale/main.dart';
import 'package:progetto_finale/models/tile_categoria_model.dart';
import 'package:progetto_finale/models/tile_club_model.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';
import '../tiles/tile_categoria.dart';
import '../tiles/tile_club.dart';

/// Pagina associata a ciascuna gara.
///
/// Contiene una tabbar che permette di scegliere tra la visualizzazione della lista delle categorie
/// per quella gara o dei club che partecipano a quella gara.
///
class PaginaGara extends StatefulWidget {
  PaginaGara({Key? key, required this.nomeGara, required this.idGara})
      : super(key: key);
  final String nomeGara;
  final String idGara;

  @override
  State<PaginaGara> createState() => _PaginaGaraState();
}

class _PaginaGaraState extends State<PaginaGara> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.nomeGara),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Categoria",
              ),
              Tab(
                text: "Club",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // TAB LISTA CATEGORIE
            FutureBuilder<List<TileCategoriaModel>>(
              future: LambdaFunctions().listClasses(widget.idGara),
              builder: (context, asyncsnapshot) {
                if (asyncsnapshot.connectionState == ConnectionState.done) {
                  if (asyncsnapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: () => Future.delayed(
                        const Duration(seconds: 1),
                      ),
                      child: ListView.builder(
                        itemCount: asyncsnapshot.data!.length,
                        itemBuilder: (context, index) {
                          // se la gara è già presene in quelle vecchie non faccio nulla
                          // altrimenti cambio il colore in giallo
                          if (!listaCategorie.contains(
                                  asyncsnapshot.data![index].idCategoria) &&
                              listaCategorie.isNotEmpty) {
                            listaCategorie
                                .add(asyncsnapshot.data![index].idCategoria);
                            return TileCategoria(
                              isNew: true,
                              model: asyncsnapshot.data![index],
                              idGara: widget.idGara,
                            );
                          } else {
                            return TileCategoria(
                              model: asyncsnapshot.data![index],
                              idGara: widget.idGara,
                            );
                          }
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

            // TAB LISTA CLUB
            FutureBuilder<List<TileClubModel>>(
              future: LambdaFunctions().listClubs(widget.idGara),
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
                          if (!listaClub
                              .contains(asyncsnapshot.data![index].idClub)) {
                            listaClub.add(asyncsnapshot.data![index].idClub);
                            return TileClub(
                              isNew: true,
                              model: asyncsnapshot.data![index],
                              idGara: widget.idGara,
                            );
                          } else {
                            return TileClub(
                              model: asyncsnapshot.data![index],
                              idGara: widget.idGara,
                            );
                          }
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
          ],
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
