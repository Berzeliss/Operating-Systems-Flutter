import 'package:flutter/material.dart';
import 'package:super_mario_project/button.dart';
import 'package:super_mario_project/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: const Color.fromARGB(255, 120, 175, 220),
            )),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 146, 83, 62),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Arrow(child: Icon(Icons.arrow_back)),
                  Arrow(child: Icon(Icons.arrow_upward)),
                  Arrow(child: Icon(Icons.arrow_forward))
              ],),
            ))
        ],
      ),
    );
  }
}
