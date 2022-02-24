import 'package:flutter/material.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.upload),
        onPressed: onPressed,
      ),
    );
  }
}
