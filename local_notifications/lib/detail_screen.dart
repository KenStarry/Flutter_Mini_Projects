import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String? payload;

  const DetailScreen({Key? key, required this.payload}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Look at This Dude!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Passed from the notification...",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.payload ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
