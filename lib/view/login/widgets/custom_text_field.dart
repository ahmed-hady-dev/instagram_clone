import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    this.obscureText = false,
    required this.hintText,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
