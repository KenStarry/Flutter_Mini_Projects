import 'package:flutter/material.dart';
import 'package:rest_apis/post.dart';
import 'package:rest_apis/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemBuilder: (context, index) => Container(child: Text(posts?[index].title ?? "")),
          itemCount: posts?.length ?? 0,
        ),
        replacement: CircularProgressIndicator(),
      ),
    );
  }
}
