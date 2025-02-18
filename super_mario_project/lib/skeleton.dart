import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget{
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 40,
      child: Image.asset("lib/image/skeleton.png", fit: BoxFit.cover),
    );
  }
}
