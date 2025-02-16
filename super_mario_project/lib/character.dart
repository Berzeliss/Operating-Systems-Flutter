import 'dart:math';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  final String direction;
  final running;

  const Character({super.key, required this.direction, this.running});

  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return SizedBox(
        width: 50,
        height: 75,
        child:  running ? Image.asset('lib/image/stand.png', fit: BoxFit.cover,): Image.asset('lib/image/run.png', fit: BoxFit.cover,),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),  // "flip" where the character is facing
        child: SizedBox(
          width: 50,
          height: 75,
          child: running ? Image.asset('lib/image/stand.png', fit: BoxFit.cover,): Image.asset('lib/image/run.png', fit: BoxFit.cover,),
        ),
      );
    }
  }
}
