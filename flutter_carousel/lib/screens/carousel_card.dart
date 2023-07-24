import 'package:flutter/material.dart';
import 'package:flutter_carousel/models/models.dart';
import 'package:flutter_carousel/screens/details.dart';

class CarouselCard extends StatelessWidget {
  late DataModel dataModel;

  CarouselCard({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: dataModel.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(dataModel: dataModel)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(dataModel.imageName),
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            dataModel.title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            dataModel.price,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        )
      ],
    );
  }
}
