import 'package:flutter/material.dart';

class extenstion extends StatelessWidget{
  extenstion({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          Text("languages"),
          Text("threme")
        ],
      ),
    );
  }
}