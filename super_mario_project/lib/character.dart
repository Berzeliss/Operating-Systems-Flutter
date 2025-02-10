import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 75,
      child: Image.asset(
        'lib/image/stand.png',
        fit: BoxFit.cover,
        ),
    );
  }
}
