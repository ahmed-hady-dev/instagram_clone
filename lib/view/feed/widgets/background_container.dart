import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/core/responsive_helper/responsive_layout.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: width > kWebBreakPoint
                    ? AppColors.webBackgroundColor
                    : AppColors.mobileBackgroundColor),
            color: AppColors.mobileBackgroundColor),
        child: child);
  }
}
