import 'package:flutter/material.dart';

class categoria extends StatefulWidget {
  categoria({Key? key}) : super(key: key);

  @override
  State<categoria> createState() => _categoriaState();
}

class _categoriaState extends State<categoria> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 1, bottom: 4),
          child: Row(
            children: [
              const Text(
                'Nome categoria:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 8),
          child: Row(
            children: [
              const Text(
                'Data:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
