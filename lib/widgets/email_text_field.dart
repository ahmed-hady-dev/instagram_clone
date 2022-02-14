import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
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
        decoration: const InputDecoration(
            hintText: 'Enter your email',
            filled: true,
            contentPadding: EdgeInsets.all(8)),
        validator: (value) {
          if (value!.isEmpty) {
            return "Email must not be empty";
          } else if (!value.contains('@')) {
            return "Please enter a valid email!";
          } else {
            return null;
          }
        },
        onFieldSubmitted: onFieldSubmitted);
  }
}
