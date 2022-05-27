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
          builder: (context) => PaginaGara(
            nomeGara: widget.model.title,
            idGara: widget.model.id,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.all(5),
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
              child: Text(
                "Data e Ora di partenza: \t${widget.model.data}, \t${widget.model.ora}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Luogo
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Luogo di Partenza: \t ${widget.model.luogo}",
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
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
