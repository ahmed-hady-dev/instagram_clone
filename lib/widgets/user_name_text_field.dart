import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    Key? key,
    required this.controller,
    required this.onFieldSubmitted,
  }) : super(key: key);
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(hintText: 'Enter your username'),
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
