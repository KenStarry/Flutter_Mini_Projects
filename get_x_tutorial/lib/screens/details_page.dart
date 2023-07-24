import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Map<dynamic, dynamic>? data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details page"),
        leading: IconButton(
            onPressed: () => Get.back(canPop: true),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(data == null ? "" : data!['title']),
              MaterialButton(
                onPressed: () => Get.back(canPop: true),
                child: Text("Go to home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
