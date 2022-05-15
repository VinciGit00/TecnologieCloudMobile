import 'package:flutter/material.dart';
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => postPage()));
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
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 1)),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => TileGara(
            data: "10-01-2000",
            orarioPartenza: "17:39",
            id: "hjj2jhjhj-jhjhj23",
            nomeGara: "Nome Prima Gara",
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
