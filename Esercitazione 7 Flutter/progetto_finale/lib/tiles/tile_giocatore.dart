import 'package:flutter/material.dart';

import '../models/tile_giocatore_model.dart';

class TileGiocatore extends StatefulWidget {
  TileGiocatore(
      {Key? key,
      required this.model,
      this.isNew = false,
      required this.isCategoria})
      : super(key: key);

  final TileGiocatoreModel model;
  final bool isCategoria;
  final bool isNew;

  @override
  State<TileGiocatore> createState() => _TileGiocatoreState();
}

class _TileGiocatoreState extends State<TileGiocatore> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: widget.isNew ? Colors.yellow : Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome Giocatore
            Text(
              widget.model.nomeGiocatore!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            // NomeClub / Categoria
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                widget.isCategoria
                    ? "Club: ${widget.model.nomeClub}"
                    : "Categoria: ${widget.model.nomeCategoria}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // ID
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "ID: ${widget.model.idGiocatore}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Status
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Status: ${widget.model.status}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Codice Nazione
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Nazione: ${widget.model.nazione}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Score
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Score: ${widget.model.score}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Time
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Time: ${widget.model.time}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
