import 'package:flutter/material.dart';

class Coin extends StatelessWidget{
  const Coin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Image.asset("lib/image/coin.png", fit: BoxFit.cover),
    );
  }
}