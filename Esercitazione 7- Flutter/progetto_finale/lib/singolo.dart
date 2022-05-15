import 'package:flutter/material.dart';
import 'Widget semplici/widgetSingolo.dart';

class SingoloGiocatore extends StatefulWidget {
  SingoloGiocatore({Key? key}) : super(key: key);

  @override
  State<SingoloGiocatore> createState() => _SingoloGiocatoreState();
}

class _SingoloGiocatoreState extends State<SingoloGiocatore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nome categoria"),
      ),
      body: Container(
          child: Column(children: [
        Container(
          width: 400,
          height: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          child: GestureDetector(onTap: () {}, child: SingoloGiocatore()),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
        )
      ])),
    );
  }
}
