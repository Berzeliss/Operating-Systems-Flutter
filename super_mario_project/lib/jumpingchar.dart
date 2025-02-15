import 'dart:math';

import 'package:flutter/material.dart';


class Jumping extends StatelessWidget {
  final String direction;
  const Jumping({super.key, required this.direction});

  @override
  Widget build(BuildContext context) {
   if(direction == "right") {
    return SizedBox(
        width: 50,
        height: 75,
        child: Image.asset(
          'lib/image/jump.png',
          fit: BoxFit.cover,
        ),
    );
   } else {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: SizedBox(
          width: 50,
          height: 75,
          child: Image.asset(
            'lib/image/jump.png',
            fit: BoxFit.cover,
          ),
      ),
    );
   }
  }
}