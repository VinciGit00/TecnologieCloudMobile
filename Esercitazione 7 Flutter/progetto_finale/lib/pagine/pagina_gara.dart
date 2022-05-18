import 'package:flutter/material.dart';
import 'package:progetto_finale/logica/lambda_functions.dart';
import 'package:progetto_finale/models/tile_categoria_model.dart';
import 'package:progetto_finale/models/tile_club_model.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';

import '../tiles/tile_categoria.dart';
import '../tiles/tile_club.dart';

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
          bottom: const TabBar(tabs: [
            Tab(
              text: "Categoria",
            ),
            Tab(
              text: "Club",
            )
          ]),
        ),
        body: TabBarView(
          children: [
            // Tab Classifica per Categoria
            FutureBuilder<List<TileCategoriaModel>>(
              future: LambdaFunctions().listClasses(widget.idGara),
              builder: (context, asyncsnapshot) {
                if (asyncsnapshot.connectionState == ConnectionState.done) {
                  if (asyncsnapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: () =>
                          Future.delayed(const Duration(seconds: 1)),
                      child: ListView.builder(
                        itemCount: asyncsnapshot.data!.length,
                        itemBuilder: (context, index) => TileCategoria(
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

            // Classifica Tab Club
            FutureBuilder<List<TileClubModel>>(
              // TODO ADD ID CLUB
              future: LambdaFunctions().listClubs(widget.idGara, ""),
              builder: (context, asyncsnapshot) {
                if (asyncsnapshot.connectionState == ConnectionState.done) {
                  if (asyncsnapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: () =>
                          Future.delayed(const Duration(seconds: 1)),
                      child: ListView.builder(
                        itemCount: asyncsnapshot.data!.length,
                        itemBuilder: (context, index) => TileClub(
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
          ],
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
