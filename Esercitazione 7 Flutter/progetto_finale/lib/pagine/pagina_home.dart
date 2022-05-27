import 'package:flutter/material.dart';
import 'package:progetto_finale/logica/lambda_functions.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import '../tiles/tile_gara.dart';

/// Pagina principale iniziale.
///
/// In questa pagina viene visualizzata la lista delle gare attualmente attive.
///
class PaginaHome extends StatefulWidget {
  PaginaHome({Key? key}) : super(key: key);

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista gare"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<TileGaraModel>>(
        future: LambdaFunctions().listraces(),
        builder: (context, asyncsnapshot) {
          if (asyncsnapshot.connectionState == ConnectionState.done) {
            if (asyncsnapshot.hasData) {
              return RefreshIndicator(
                // Quando eseguo refresh pagina, eseguo query che carica nuovi risultati e li visualizzo
                // I nuovi risultati verranno visualizzati in giallo. Rimarranno in giallo fino al refresh successivo
                onRefresh: () async {
                  setState(() {});
                },
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  itemCount: asyncsnapshot.data!.length,
                  itemBuilder: (context, index) {
                    return TileGara(
                      model: asyncsnapshot.data![index],
                    );
                  },
                ),
              );
            }
            return Center(
              child: Text("Nessun Risultato Trovato"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
