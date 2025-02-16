import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mario_project/button.dart';
import 'package:super_mario_project/character.dart';
import 'package:super_mario_project/jumpingChar.dart';
import 'package:super_mario_project/skeleton.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double charX = -0.5;
  static double charY = 1;
  static double skeleX = 0.5;
  static double skeleY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = charY;
  String direction = "right";
  bool running = false;
  bool jumping = false;
  var font = GoogleFonts.pressStart2p(color: Colors.white, fontSize: 25);
  double life = 5;
  double score = 0;

  void checkIfMeetSkele() {
    if ((charX-skeleX).abs()<0.05 && (charY-skeleY).abs()<0.05) {
      setState(() {
        skeleX = 100;  // set out of 1 to remove it
        life -= 1;
      });

      // Respawn
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          skeleX = -0.8 + (1.6 * (Random().nextDouble()));
        });
      });
    }
  }

  void preJump() {
    time = 0;
    charY = initialHeight; 
  }

  void jump() {
    if (jumping==false) {  // no double jump allowed
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
  }

  void moveRight() {
    direction = "right";
    checkIfMeetSkele();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      checkIfMeetSkele();
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
    checkIfMeetSkele();
     Timer.periodic(Duration(milliseconds: 50), (timer) {
      checkIfMeetSkele();
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
            child: Stack(  // stack: children will render in order, from topleft to bottom right
              children: [
                Container(
                  color: const Color.fromARGB(255, 39, 122, 225),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(charX, charY),
                    child: jumping ? JumpingChar(direction: direction,) : Character(direction: direction, running: running,)
                  ),
                ),
                Container(
                  alignment: Alignment(skeleX, skeleY),
                  child: Skeleton()
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [Text("Life", style: font,), SizedBox(height: 8), Text("$life", style: font,)]),
                      Column(children: [Text("Level", style: font,), SizedBox(height: 8), Text("1-1", style: font,)]),
                      Column(children: [Text("Score", style: font,), SizedBox(height: 8), Text("$score", style: font,)])
                    ],
                  ),
                )
              ],
            )
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
