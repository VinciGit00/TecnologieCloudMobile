import 'package:flutter/material.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';

import '../tiles/tile_categoria.dart';
import '../tiles/tile_club.dart';

class PaginaGara extends StatefulWidget {
  PaginaGara({Key? key, required this.nomeGara}) : super(key: key);
  final String nomeGara;

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
            RefreshIndicator(
              onRefresh: () => Future.delayed(const Duration(seconds: 1)),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => TileCategoria(
                  dislivello: "200m",
                  distanza: "2540km",
                  nomeCategoria: "Nome Prima Categoria",
                ),
              ),
            ),

            // Classifica Tab Club
            RefreshIndicator(
              onRefresh: () => Future.delayed(const Duration(seconds: 1)),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => TileClub(
                  nomeClub: "Nome Club",
                  nazione: "Italia",
                  idClub: "1212-23432-123123",
                  nomeCategoria: "Categoria del Club",
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
