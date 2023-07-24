import 'package:flutter/material.dart';
import 'package:stories/components/story_circle.dart';
import 'package:stories/story_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _openStory() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("S T O R I E S"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCircle(
                    onTap: _openStory,
                  );
                }),
          )
        ],
      ),
    );
  }
}
