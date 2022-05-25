import 'package:flutter/material.dart';
import 'package:progetto_finale/logica/lambda_functions.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import '../elementiDrawer/get.dart';
import '../elementiDrawer/post.dart';
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
      /// APP BAR
      appBar: AppBar(
        title: const Text("Lista gare"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 44,
            ),
            ListTile(
              title: const Text('Post'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => postPage(),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: const Text('Get'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GetPage()));
              },
            ),
          ],
        ),
      ),

      /// BODY
      body: FutureBuilder<List<TileGaraModel>>(
        future: LambdaFunctions().listraces(),
        builder: (context, asyncsnapshot) {
          if (asyncsnapshot.connectionState == ConnectionState.done) {
            if (asyncsnapshot.hasData) {
              return RefreshIndicator(
                // quando aggiorno la pagina con scroll, eseguo refresh pagina
                onRefresh: () async {
                  setState(() {});
                },
                child: ListView.builder(
                  itemCount: asyncsnapshot.data!.length,
                  itemBuilder: (context, index) {
                    return TileGara(
                      model: asyncsnapshot.data![index],
                    );

                    /* // se la gara non è già non presente in quelle vecchie cambio il colore in giallo
                    if (!listaGare.contains(asyncsnapshot.data![index].id)) {
                      // se la lista iniziale è vuota non mostro tutti i nuovi risultati in giallo
                      listaGare.add(asyncsnapshot.data![index].id);
                      return TileGara(
                        isNew: true,
                        model: asyncsnapshot.data![index],
                      );
                    } else {
                      return TileGara(
                        model: asyncsnapshot.data![index],
                      );
                    } */
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
