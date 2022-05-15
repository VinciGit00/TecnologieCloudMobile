import 'package:flutter/material.dart';
import 'package:progetto_finale/paginaGare.dart';
import 'themes/theme.dart';
import 'elementiDrawer/get.dart';
import 'elementiDrawer/post.dart';
import 'Widget semplici/categoria.dart';
import 'Widget semplici/refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: dark,
      theme: white,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista gare"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.refresh,
              size: 26.0,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 45,
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
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 1)),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    onPressed: () => {},
                    child: Container(
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
                          child: categoria()),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ),
                refresh()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
