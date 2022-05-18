import 'package:flutter/material.dart';
import 'package:progetto_finale/logica/lambda_functions.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // TODO: refresh pagina
      onTap: (_) {},
      backgroundColor: Colors.red,
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.abc,
            color: Colors.transparent,
          ),
        ),
        BottomNavigationBarItem(
          label: "Refresh",
          icon: Icon(Icons.refresh),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.abc,
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}
