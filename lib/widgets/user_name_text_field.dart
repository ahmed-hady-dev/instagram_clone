import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
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
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(hintText: 'Enter your username'),
        focusNode: focusNode,
        validator: (value) {
          if (value!.isEmpty) {
            return "username must not be empty";
          } else {
            return null;
          }
        },
        onFieldSubmitted: onFieldSubmitted);
  }
}
