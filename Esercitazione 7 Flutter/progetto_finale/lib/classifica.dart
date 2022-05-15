import 'package:flutter/material.dart';

class ClassificaGiocatori extends StatefulWidget {
  ClassificaGiocatori({Key? key}) : super(key: key);

  @override
  State<ClassificaGiocatori> createState() => _ClassificaGiocatoriState();
}

class _ClassificaGiocatoriState extends State<ClassificaGiocatori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categoria individuale"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
