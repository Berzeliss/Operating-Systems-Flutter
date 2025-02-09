import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  const Arrow({super.key, this.child});

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Colors.brown[300],
        child: child
      ),
    );
  }
}