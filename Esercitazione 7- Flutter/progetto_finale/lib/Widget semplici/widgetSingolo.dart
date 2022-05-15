import 'package:flutter/material.dart';

class SingoloGiocatore extends StatefulWidget {
  SingoloGiocatore({Key? key}) : super(key: key);

  @override
  State<SingoloGiocatore> createState() => _SingoloGiocatoreState();
}

class _SingoloGiocatoreState extends State<SingoloGiocatore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 1, bottom: 4),
          child: Row(
            children: [
              const Text(
                'Nome e cognome:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 8),
          child: Row(
            children: [
              const Text(
                'Nome club:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            children: [
              const Text(
                'ID:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            children: [
              const Text(
                'Status:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            children: [
              const Text(
                'Codice nazione:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            children: [
              const Text(
                'score:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            children: [
              const Text(
                'time:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
