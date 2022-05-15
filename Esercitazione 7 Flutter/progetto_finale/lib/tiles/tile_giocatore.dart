import 'package:flutter/material.dart';

class TileGiocatore extends StatefulWidget {
  TileGiocatore(
      {Key? key,
      required this.codiceNazione,
      required this.idGiocatore,
      this.nomeClub = "",
      this.nomeCategoria = "",
      required this.nomeGiocatore,
      required this.score,
      required this.status,
      required this.time})
      : super(key: key);
  final String nomeGiocatore;
  final String nomeClub;
  final String nomeCategoria;
  final String idGiocatore;
  final String status;
  final String codiceNazione;
  final String score;
  final String time;

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
              widget.nomeGiocatore,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            // NomeClub
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Club: ${widget.nomeClub},",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // ID
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "ID: ${widget.idGiocatore}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Status
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Status: ${widget.status}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Codice Nazione
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Nazione: ${widget.codiceNazione}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Score
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Score: ${widget.score}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            // Time
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Nazione: ${widget.time}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
