import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stories/components/story_bars.dart';
import 'package:stories/components/story_progress_bar.dart';
import 'package:stories/stories/story_1.dart';
import 'package:stories/stories/story_2.dart';
import 'package:stories/stories/story_3.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;

  final List<Widget> stories = [
    Story1(),
    Story2(),
    Story3(),
  ];

  List<double> percentWatched = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < stories.length; i++) {
      percentWatched.add(0);
    }

    _startWatching();
  }
  
  void _startWatching() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (percentWatched[currentStoryIndex] + 0.01 < 1) {
          percentWatched[currentStoryIndex] += 0.01;
        } else {
          percentWatched[currentStoryIndex] = 1;
          timer.cancel();

          //  go to next story after cancelling
          if (currentStoryIndex < stories.length - 1) {
            currentStoryIndex++;
            //  restart our timer
            _startWatching();
          } else {
            //  return to home page after finishing last story
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onStoryTap(TapDownDetails details) {
    //  get screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    //  Taps on the left side of the screen
    if (dx < screenWidth / 2) {

      setState(() {
        //  as long as it isn't the first story
        if (currentStoryIndex > 0) {
          percentWatched[currentStoryIndex - 1] = 0;
          percentWatched[currentStoryIndex] = 0;

          currentStoryIndex--;
        }
      });

    } else {
      //  taps on the right side of the screen
      setState(() {
        //  as long as it isn't the first story
        if (currentStoryIndex < stories.length - 1) {
          //  finish the current story
          percentWatched[currentStoryIndex] = 1;

          currentStoryIndex++;
        } else {
          percentWatched[currentStoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTapDown: (details) => _onStoryTap(details),
        child: Scaffold(
          body: Stack(
            children: [
              stories[currentStoryIndex],

              //  progress bar
              StoryBars(
                percentWatched: percentWatched,
              )
            ],
          ),
        ),
      ),
    );
  }
}
