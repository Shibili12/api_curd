import 'package:flutter/material.dart';

class Appbutton extends StatelessWidget {
  String name;
  void Function() onclick;
  Appbutton({required this.name, required this.onclick, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          minimumSize: Size(300, 50),
        ),
        onPressed: onclick,
        child: Text(name),
      ),
    );
  }
}
