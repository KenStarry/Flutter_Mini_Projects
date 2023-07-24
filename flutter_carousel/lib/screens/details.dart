import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailsScreen extends StatefulWidget {

  final DataModel dataModel;

  const DetailsScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using Hero Image"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: AspectRatio(
              aspectRatio: 0.8,
              child: Expanded(
                child: Hero(
                  tag: widget.dataModel.imageName,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(widget.dataModel.imageName),
                            fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black26)
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
