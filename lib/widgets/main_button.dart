import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/constants/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.onPressed,
    this.primary = AppColors.blueColor,
    this.onPrimary = Colors.white,
    required this.child,
  }) : super(key: key);
  final Function onPressed;
  final Color? primary;
  final Color? onPrimary;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primary, onPrimary: onPrimary),
            onPressed: () {
              HapticFeedback.vibrate();
              onPressed();
            },
            child: child));
  }
}
