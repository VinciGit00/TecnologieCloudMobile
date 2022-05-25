import 'package:flutter/material.dart';
import 'package:progetto_finale/pagine/pagina_home.dart';
import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

/// Liste usate per memorizzare i contenuti fetchati per ultimi
/// Le utilizzo per capire quali sono i nuovi valori fetchati
List<String> listaGareOld = [];
List<String> listaCategorieOld = [];
List<String> listaClubOld = [];
// lista usata sia per i giocatori della classifca per club che per giocatori per categoria
// la lista si pulisce ogni volta che
List<String> listaGiocatoriOld = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: dark,
      theme: white,
      home: PaginaHome(),
    );
  }
}
