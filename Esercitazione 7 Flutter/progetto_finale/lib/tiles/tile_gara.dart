import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_finale/pagine/pagina_gara.dart';

class TileGara extends StatefulWidget {
  TileGara(
      {Key? key,
      required this.data,
      required this.orarioPartenza,
      required this.id,
      required this.nomeGara})
      : super(key: key);

  final String nomeGara;
  final String id;
  final String data;
  final String orarioPartenza;

  @override
  State<TileGara> createState() => _TileGaraState();
}

class _TileGaraState extends State<TileGara> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => PaginaGara(nomeGara: widget.nomeGara),
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
              widget.nomeGara,
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
                          "${widget.data},",
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
                        widget.orarioPartenza,
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
              child: Row(
                children: [
                  Text(
                    "ID gara: ${widget.id}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
