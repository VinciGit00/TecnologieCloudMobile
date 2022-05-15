import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_finale/pagine/pagina_classifica_giocatori.dart';

class TileClub extends StatefulWidget {
  TileClub(
      {Key? key,
      required this.nomeCategoria,
      required this.nazione,
      required this.idClub,
      required this.nomeClub})
      : super(key: key);
  final String nomeCategoria;
  final String nomeClub;
  final String nazione;
  final String idClub;

  @override
  State<TileClub> createState() => _TileClubState();
}

class _TileClubState extends State<TileClub> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        // TODO: creare classifica giocatori  per  categoria
        CupertinoPageRoute(
          builder: (context) => PaginaClassificaGiocatori(
            title: widget.nomeClub,
          ),
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
            // Nome Club
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                widget.nomeClub,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),

            // Nome categoria
            Text(
              "Categoria: ${widget.nomeCategoria}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),

            // Nazione
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "nazione: ${widget.nazione}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // idClub
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  Text(
                    "idClub: ${widget.idClub}",
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
