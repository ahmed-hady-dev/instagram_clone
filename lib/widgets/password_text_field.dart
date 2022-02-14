import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.onFieldSubmitted,
    required this.obscureText,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String) onFieldSubmitted;
  final bool obscureText;
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
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
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: 'Enter your password',
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
      ),
    );
  }
}
