import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var point1 = Offset(size.width, 0);
    var point2 = Offset(0, size.height);
    var paint = Paint()..color = Colors.white
    ..strokeWidth = 10;

    canvas.drawLine(point1, point2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
