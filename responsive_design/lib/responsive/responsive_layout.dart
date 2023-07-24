import 'package:flutter/material.dart';
import 'package:responsive_design/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout({Key? key, required this.mobileBody, required this.desktopBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileSize) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
