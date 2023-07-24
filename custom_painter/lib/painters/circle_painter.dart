import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Instructions for painting on the canvas
    var center = size / 2;
    var paint = Paint()..color = Colors.blue;
    
    canvas.drawCircle(Offset(center.width, center.height), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Whether to repaint the canvas based on the new parameters
    return false;
  }
}
