import 'package:flutter/material.dart';

class GetPage extends StatefulWidget {
  GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get data"),
      ),
      body: Column(children: [],),

    );
  }
}