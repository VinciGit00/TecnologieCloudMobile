import 'package:flutter/material.dart';
import 'package:http_request/logica.dart';

class postPage extends StatefulWidget {
  postPage({Key? key}) : super(key: key);

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post data"),
        actions: [
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : IconButton(
                  onPressed: () async {
                    if(_controller.text!="") {
                        setState(() {
                       _isLoading = true;
                      });
                      await postData(_controller.text);
                      Navigator.pop(context);
                      _isLoading = false;
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Devi inserire i dati prima di fare una POST!'),
                      );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
        ],
      ),
      body: Column(
        children: [
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
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  // style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    alignLabelWithHint: false,
                    hintText: 'Inserisci il contenuto della post',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
