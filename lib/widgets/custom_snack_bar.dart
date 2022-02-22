import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/core/router/router.dart';

showSnackBar({required String msg, required SnackBarStates snackBarStates}) {
  ScaffoldMessenger.of(MagicRouter.currentContext!).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1500),
    content: Text(msg, style: const TextStyle(color: Colors.white)),
    backgroundColor: chooseToastColor(snackBarStates),
  ));
}

enum SnackBarStates { success, error, warning, normal }

Color chooseToastColor(SnackBarStates snackBarStates) {
  Color color;
  switch (snackBarStates) {
    case SnackBarStates.success:
      color = Colors.green;
      break;
    case SnackBarStates.error:
      color = Colors.red;
      break;
    case SnackBarStates.warning:
      color = Colors.amber;
      break;
    case SnackBarStates.normal:
      color = AppColors.primaryColor;
      break;
    default:
      color = AppColors.primaryColor;
  }
  return color;
}
