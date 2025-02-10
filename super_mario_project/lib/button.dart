import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Widget child;
  // ignore: prefer_typing_uninitialized_variables
  final jumpFunction;
  const Arrow({super.key, this.jumpFunction, required this.child});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: jumpFunction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.brown[300],
          child: child
        ),
      ),
    );
  }
}