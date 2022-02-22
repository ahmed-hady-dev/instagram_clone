import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
    {required String msg,
    required ToastedStates state,
    ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastedStates { success, error, warning }

Color chooseToastColor(ToastedStates states) {
  Color color;
  switch (states) {
    case ToastedStates.success:
      color = Colors.green;
      break;
    case ToastedStates.error:
      color = Colors.red;
      break;
    case ToastedStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
