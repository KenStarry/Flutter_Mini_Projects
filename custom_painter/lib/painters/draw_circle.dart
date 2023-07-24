import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width, 0);
    var radius = 50.0;
    var paint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
