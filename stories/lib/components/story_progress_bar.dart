import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StoryProgressBar extends StatelessWidget {

  double percentWatched = 0;

  StoryProgressBar({Key? key, required this.percentWatched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 14,
      percent: percentWatched,
      barRadius: Radius.circular(16),
      progressColor: Colors.grey.shade400,
      backgroundColor: Colors.grey.shade600,
    );
  }
}
