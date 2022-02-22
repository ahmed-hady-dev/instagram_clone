import 'package:flutter/material.dart';

class BioTextField extends StatelessWidget {
  const BioTextField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        focusNode: focusNode,
        decoration: const InputDecoration(
            hintText: 'Enter your bio',
            filled: true,
            contentPadding: EdgeInsets.all(8)),
        onFieldSubmitted: onFieldSubmitted);
  }
}
