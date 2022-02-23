import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/app_colors.dart';

class PickImageAvatar extends StatelessWidget {
  const PickImageAvatar({
    Key? key,
    this.image,
    this.onPressed,
  }) : super(key: key);

  final Uint8List? image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          image == null
              ? const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  backgroundColor: Colors.grey)
              : CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(image!),
                  backgroundColor: Colors.grey),
          Positioned(
            bottom: -10,
            left: 80,
            child: IconButton(
              onPressed: onPressed,
              icon: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mobileBackgroundColor),
                  child: const Icon(Icons.add_a_photo, size: 20.0)),
            ),
          )
        ],
      ),
    );
  }
}
