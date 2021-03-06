import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;
  CustomRaisedButton(
      {@required this.child, this.height : 50.0, this.borderRadius :2.0, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        color: color,
        elevation: 5,
        onPressed: onPressed,
      ),
    );
  }
}
