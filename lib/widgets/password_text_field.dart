import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.onPressed,
    required this.icon,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscureText;
  final Function() onPressed;
  final IconData icon;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password must not be empty";
        } else if (value.length < 6) {
          return "Password must be 6 digits at least";
        } else if (value.contains(' ')) {
          return "Password must not contain spaces";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter your password',
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
      ),
    );
  }
}
