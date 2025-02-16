import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_mario_project/button.dart';
import 'package:super_mario_project/character.dart';
import 'package:super_mario_project/jumpingChar.dart'; 

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
  String direction = "right";
  bool running = false;
  bool jumping = false;

  void preJump() {
    time = 0;
    charY = initialHeight; 
  }

  void jump() {
    jumping = true;
    preJump();  // reset everything to starting location when user clicks jump
    Timer.periodic(Duration(milliseconds: 30), ((timer) {
      time += 0.02;
      height = -3.5 * time * time + 5 * time;

      if (initialHeight - height >= 0.99) {  // prevent character from "sinking"
        jumping = false;
        setState(() {
          charY = 1;
        });
        timer.cancel();  // so the character doesn't jump carzily fast
      } else {
        setState(() {
          charY = initialHeight - height; // note: not plus because 1 is bottom and -1 is up
        });
      }

    }));
  }

  void moveRight() {
    direction = "right";

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if(Arrow.holdingButton == true) {
        setState(() {
          charX += 0.02;
          running = !running;
        });
      } else {
        timer.cancel();  // stops character when user doesn't hold button
      }
    });
  }

  void moveLeft() {
    direction = "left";
    
     Timer.periodic(Duration(milliseconds: 50), (timer) {
      if(Arrow.holdingButton == true) {
        setState(() {
          charX -= 0.02;
          running = !running;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sky part
          Expanded(  
            flex: 4,
            child: Container(
              color: const Color.fromARGB(255, 39, 122, 225),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(charX, charY),
                child: jumping ? JumpingChar(direction: direction,) : Character(direction: direction, running: running,)
              ),
            ),
          ),
          // Ground part
          Expanded(  
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 78, 24, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Arrow(leftFunction: moveLeft, child: Icon(Icons.arrow_back)),
                  Arrow(jumpFunction: jump, child: Icon(Icons.arrow_upward)),
                  Arrow(rightFunction: moveRight, child: Icon(Icons.arrow_forward)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
