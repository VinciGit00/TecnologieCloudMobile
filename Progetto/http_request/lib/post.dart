import 'package:flutter/material.dart';

class postPage extends StatefulWidget {
  postPage({Key? key}) : super(key: key);

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  TextEditingController _contentuto = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Post data"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.send))
        ],
      ),
      body: Column(children: [
         Expanded(
              child: Container(
                /*decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),*/
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                    textAlignVertical: const TextAlignVertical(y: -1),
                    controller: _contentuto,
                    maxLines: null,
                    expands: true,
                    // style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      alignLabelWithHint: false,
                      hintText: 'Contenuto',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                ),
              ),
            )
      ],),
    );
  }
}