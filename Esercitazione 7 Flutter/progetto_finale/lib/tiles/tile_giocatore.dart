import 'package:flutter/material.dart';

import '../models/tile_giocatore_model.dart';

class TileGiocatore extends StatefulWidget {
  TileGiocatore({Key? key, required this.model, required this.isCategoria}) : super(key: key);

  final TileGiocatoreModel model;
  final bool isCategoria;

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
          color: widget.model.isNew ? Colors.yellow : Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.model.nomeGiocatore!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NomeClub / Categoria
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Text(
                          widget.isCategoria ? "Club: ${widget.model.nomeClub}" : "Categoria: ${widget.model.nomeCategoria}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),

                      // ID
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "ID: ${widget.model.idGiocatore}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),

                      // Status
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Status: ${widget.model.status}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),

                      // Codice Nazione
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Nazione: ${widget.model.nazione}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),

                      // Score
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Score: ${widget.model.score}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),

                // Maglietta
                Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.only(right: 20),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset("assets/m1.png"),
                        Positioned(
                          top: 80,
                          child: Text(
                            widget.model.numeroMaglia.toString(),
                            style: TextStyle(fontSize: 130),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // Time
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Time: ${widget.model.time}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),

                Spacer(),

                // Posizione
                Text(
                  "#" + widget.model.rank.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
