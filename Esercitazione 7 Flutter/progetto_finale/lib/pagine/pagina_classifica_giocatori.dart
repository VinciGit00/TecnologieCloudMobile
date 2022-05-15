import 'package:flutter/material.dart';
import 'package:progetto_finale/tiles/tile_giocatore.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';
import '../tiles/tile_categoria.dart';

class PaginaClassificaGiocatori extends StatefulWidget {
  PaginaClassificaGiocatori({Key? key, required this.title}) : super(key: key);
  final String title;

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
            // Tab Classifica per Categoria
            RefreshIndicator(
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
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
