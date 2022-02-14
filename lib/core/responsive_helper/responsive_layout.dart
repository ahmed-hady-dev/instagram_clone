import 'package:flutter/material.dart';

const double kPortraitBreakPoint = 480.0;
const double kWebBreakPoint = 600;

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobilePortrait,
    this.mobileLandscape,
    this.webScreen,
  }) : super(key: key);
  final Widget mobilePortrait;
  final Widget? mobileLandscape;
  final Widget? webScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > kPortraitBreakPoint &&
          constraints.maxWidth < kWebBreakPoint) {
        return mobileLandscape ?? mobilePortrait;
      } else if (constraints.maxWidth > kWebBreakPoint) {
        return webScreen ?? mobilePortrait;
      }

      return mobilePortrait;
    });
  }
}
