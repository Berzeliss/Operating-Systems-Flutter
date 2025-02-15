import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  final Widget child;
  final Function? leftFunction;
  final Function? rightFunction;
  final Function? jumpFunction;
  static bool holdingButton = false;

  const Arrow({
    super.key,
    this.leftFunction,
    this.rightFunction,
    this.jumpFunction,
    required this.child,
  });

  bool userIsHoldingButton() {
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingButton = true;
        if (leftFunction != null) leftFunction!();
        if (rightFunction != null) rightFunction!();
        if (jumpFunction != null) jumpFunction!();
      },
      onTapUp: (details) {
        holdingButton = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.brown[300],
          child: child,
        ),
      ),
    );
  }
}
