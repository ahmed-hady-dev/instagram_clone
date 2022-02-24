import 'package:flutter/material.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        "Post",
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
