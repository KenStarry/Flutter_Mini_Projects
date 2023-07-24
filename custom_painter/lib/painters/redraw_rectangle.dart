import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RedrawRectange extends CustomPainter {
  final Color rectColor;

  RedrawRectange({required this.rectColor});

  var rect =
      Rect.fromCenter(center: const Offset(100, 50), width: 50, height: 100);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(rect, Paint()..color = rectColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool? hitTest(Offset position) {
    return rect.contains(position);
  }
}
