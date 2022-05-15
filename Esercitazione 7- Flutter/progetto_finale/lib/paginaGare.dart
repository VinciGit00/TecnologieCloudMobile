import 'package:flutter/material.dart';
import 'package:progetto_finale/singolo.dart';
import 'Widget semplici/widgetgare.dart';

class PaginaGare extends StatefulWidget {
  PaginaGare({Key? key}) : super(key: key);

  @override
  State<PaginaGare> createState() => _PaginaGareState();
}

class _PaginaGareState extends State<PaginaGare> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Gara"),
            bottom: const TabBar(tabs: [
              Tab(
                text: "Categoria",
              ),
              Tab(
                text: "Club",
              )
            ]),
          ),
          body: TabBarView(
            children: [
              Container(
                  child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingoloGiocatore()));
                        },
                        child: widgetGare()),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                  ),
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 125,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaginaGare()));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2.0, top: 1, bottom: 4),
                            child: Row(
                              children: [
                                const Text(
                                  'Gara:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 2.0, bottom: 8),
                            child: Row(
                              children: [
                                const Text(
                                  'Data:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Race ID:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
