import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late final StoryController _storyController;
  late final List<StoryItem> _storyItems;

  @override
  void initState() {
    super.initState();

    _storyController = StoryController();

    _storyItems = [
      StoryItem.text(title: "Story 1", backgroundColor: Colors.blue),
      StoryItem.text(title: "Story 2", backgroundColor: Colors.redAccent),
      StoryItem.text(title: "Story 3", backgroundColor: Colors.orangeAccent),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: _storyItems,
      controller: _storyController,
      repeat: false,
    );
  }
}
