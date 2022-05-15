import 'package:flutter/material.dart';
import 'package:progetto_finale/paginaGare.dart';

class refresh extends StatefulWidget {
  refresh({Key? key}) : super(key: key);

  @override
  State<refresh> createState() => _refreshState();
}

class _refreshState extends State<refresh> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: MaterialButton(
          onPressed: () => {},
          child: Container(
            width: 900,
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaginaGare()));
                },
                child: Container(
                    child: IconButton(
                  icon: const Icon(Icons.refresh),
                  color: Colors.white,
                  onPressed: () {},
                ))),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
          ),
        ),
      ),
    );
  }
}
