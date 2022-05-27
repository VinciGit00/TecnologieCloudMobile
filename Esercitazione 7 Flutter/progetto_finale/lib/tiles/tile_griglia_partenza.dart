import 'package:flutter/material.dart';
import '../models/tile_griglia_partenza.dart';

class TileGrigliaPartenza extends StatefulWidget {
  TileGrigliaPartenza({Key? key, required this.model}) : super(key: key);

  final TileGrigliaPartenzaModel model;

  @override
  State<TileGrigliaPartenza> createState() => _TileGrigliaPartenzaState();
}

class _TileGrigliaPartenzaState extends State<TileGrigliaPartenza> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
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
          // Nome Giocatore
          Text(
            widget.model.nomeGiocatore,
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
                    // Nome Club
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: Text(
                        "Club: ${widget.model.club}",
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
                  ],
                ),
              ),

              // Maglietta
              Container(
                height: 120,
                width: 120,
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
                  "Time: ${widget.model.istantePartenza}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
