import 'package:flutter/material.dart';
import 'package:progetto_finale/pagine/pagina_home.dart';
import 'themes/theme.dart';

void main() {
  runApp(const FulminatiApp());
}

/// RECAP FOLDERS
///
/// Pagine: Contiene tutte le pagine in cui viene visualizzato il contenuto
///
/// Tiles: Sono i "blocchetti" presenti nelle liste che contengono i risultati. Ho un tile per ciascun tipo di risultati
///
/// Models: Sono le classi contenenti i dati da andare a mostrare poi per ciascuna tile
///
/// Logica: sono contenute le funzioni http per collegarsi ad aws
///
class FulminatiApp extends StatelessWidget {
  const FulminatiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gruppo Fulminati',
      themeMode: ThemeMode.system,
      darkTheme: dark,
      theme: white,
      home: PaginaHome(),
    );
  }
}

/// Liste usate per memorizzare i contenuti fetchati, le utilizzo per capire quali sono i nuovi valori fetchati
List<String> listaGareOld = [];
List<String> listaCategorieOld = [];
List<String> listaClubOld = [];
List<String> listaGiocatoriOld = [];
