import 'package:flutter/material.dart';
import 'package:progetto_finale/logica/lambda_functions.dart';
import 'package:progetto_finale/models/tile_gara_model.dart';
import 'package:progetto_finale/widgets/bottom_bar.dart';
import '../elementiDrawer/get.dart';
import '../elementiDrawer/post.dart';
import '../tiles/tile_gara.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetPage()));
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
                onRefresh: () => Future.delayed(
                  const Duration(seconds: 1),
                ),
                child: ListView.builder(
                  itemCount: asyncsnapshot.data!.length,
                  itemBuilder: (context, index) => TileGara(
                    model: asyncsnapshot.data![index],
                  ),
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

      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
