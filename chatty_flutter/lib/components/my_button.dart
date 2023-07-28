import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),),
        ),
      ),
    );
  }
}
