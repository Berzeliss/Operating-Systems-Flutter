import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_mario_project/button.dart';
import 'package:super_mario_project/character.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double charX = -0.5;
  static double charY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = charY;

  void preJump() {
    time = 0;
    charY = initialHeight; 
  }

  void jump() {
    preJump();  // reset everything to starting location when user clicks jump
    Timer.periodic(Duration(milliseconds: 20), ((timer) {
      time += 0.02;
      height = -4.9*time*time + 5*time;

      if (initialHeight - height >= 0.99) {  // prevent character from "sinking"
        setState(() {
          charY = 1;
        });
      }
      else {
        setState(() {
          charY = initialHeight - height; // note: not plus because 1 is bottom and -1 is up
        });
      }

    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(  // sky part
            flex: 4,
            child: Container(
              color: const Color.fromARGB(255, 39, 122, 225),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(charX, charY),
                child: Character()
                ),
            )),
          Expanded(  // ground part
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 78, 24, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Arrow(child: Icon(Icons.arrow_back)),
                  Arrow(jumpFunction: jump, child: Icon(Icons.arrow_upward)),
                  Arrow(child: Icon(Icons.arrow_forward))
              ],),
            ))
        ],
      ),
    );
  }
}
