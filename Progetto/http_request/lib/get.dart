import 'package:flutter/material.dart';
import 'package:http_request/logica.dart';

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(

        child: Container(
          child: Column(
            children: [
              const Text("Risultato della GET:", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900
              ),),
              FutureBuilder<String>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data!);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ],
          ),
        ),
      )
    );
  }
}
