import 'package:flutter/material.dart';
import 'package:stories/components/story_progress_bar.dart';

class StoryBars extends StatelessWidget {

  List<double> percentWatched = [];

  StoryBars({Key? key, required this.percentWatched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: StoryProgressBar(
              percentWatched: percentWatched[0],
            )),
            Expanded(
                child: StoryProgressBar(
              percentWatched: percentWatched[1],
            )),
            Expanded(
                child: StoryProgressBar(
              percentWatched: percentWatched[2],
            )),
          ],
        ),
      ),
    );
  }
}
