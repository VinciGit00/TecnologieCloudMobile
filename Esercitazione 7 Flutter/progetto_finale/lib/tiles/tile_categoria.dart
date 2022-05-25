import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_finale/pagine/pagina_classifica_giocatori.dart';

import '../models/tile_categoria_model.dart';

class TileCategoria extends StatefulWidget {
  TileCategoria({Key? key, required this.model, required this.idGara}) : super(key: key);

  final TileCategoriaModel model;

  final String idGara;

  @override
  State<TileCategoria> createState() => _TileCategoriaState();
}

class _TileCategoriaState extends State<TileCategoria> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => PaginaClassificaGiocatori(
            idGara: widget.idGara,
            title: widget.model.nomeCategoria,
            isCategoria: true,
            id: widget.model.nomeCategoria,
          ),
        ),
      ),
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome categoria
            Text(
              widget.model.nomeCategoria,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  // Dislivello
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Dislivello: ${widget.model.dislivello}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),

                  Spacer(),

                  // Distanza
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Text(
                          "Distanza: ${widget.model.distanza}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
