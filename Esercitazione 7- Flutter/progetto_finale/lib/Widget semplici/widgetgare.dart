import 'package:flutter/material.dart';

class widgetGare extends StatefulWidget {
  widgetGare({Key? key}) : super(key: key);

  @override
  State<widgetGare> createState() => _widgetGareState();
}

class _widgetGareState extends State<widgetGare> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 1, bottom: 4),
          child: Row(
            children: [
              const Text(
                'Nome categoria',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 10),
          child: Row(
            children: [
              const Text(
                'Dislivello:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  'Distanza:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
