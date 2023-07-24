import 'package:flutter/material.dart';
import 'package:flutter_carousel/models/models.dart';
import 'package:flutter_carousel/screens/details.dart';
import 'package:flutter_carousel/screens/home.dart';

void main() => runApp(MaterialApp(
  home: HomeScreen(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.deepOrange
  ),
));