import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_carousel/screens/carousel_card.dart';

import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
        initialPage: _currentPageIndex,
        viewportFraction: 0.8 // to make the pager not fill the whole screen
        );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: Text(
                    "Find Your Style",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 0.8,
                child: PageView.builder(
                    itemCount: dataList.length,
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, position) {
                      return carouselView(position);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    //  creating the tilt animation effect
    return AnimatedBuilder(
      animation: _pageController, // enabling smooth swiping effect
      builder: (context, child) {
        double value = 0.0;

        //  is the controller ready?
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.03).clamp(-1, 1);
        }

        return Transform.rotate(
          angle: pi * value,
          child: CarouselCard(dataModel: dataList[index]),
        );
      },
    );
  }
}
