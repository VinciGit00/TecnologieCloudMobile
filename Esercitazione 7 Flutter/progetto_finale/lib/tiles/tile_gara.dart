import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_finale/pagine/pagina_gara.dart';

import '../models/tile_gara_model.dart';

class TileGara extends StatefulWidget {
  TileGara({Key? key, required this.model}) : super(key: key);

  final TileGaraModel model;

  @override
  State<TileGara> createState() => _TileGaraState();
}

class _TileGaraState extends State<TileGara> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // quando premo sulla tile, vado alla pagina della gara selezionata
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => PaginaGara(nomeGara: widget.model.title),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
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
            // Nome Gara
            Text(
              widget.model.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            // Data
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Text(
                          "${widget.model.data},",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  // Orario
                  Row(
                    children: [
                      Text(
                        widget.model.ora,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ID
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "ID gara: \n${widget.model.id}",
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
