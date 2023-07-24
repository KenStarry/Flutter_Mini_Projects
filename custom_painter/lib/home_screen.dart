import 'package:custom_painter/painters/circle_painter.dart';
import 'package:custom_painter/painters/draw_circle.dart';
import 'package:custom_painter/painters/draw_line.dart';
import 'package:custom_painter/painters/redraw_rectangle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          color: Colors.red,
          child: CustomPaint(
            painter: DrawLine()
            // child: SafeArea(
            //   child: Center(
            //     child: Container(
            //       width: 300,
            //       height: 250,
            //       color: Colors.red,
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
