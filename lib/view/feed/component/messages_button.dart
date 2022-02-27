import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/app_colors.dart';

class MessagesButton extends StatelessWidget {
  const MessagesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.messenger_outline,
        color: AppColors.primaryColor,
      ),
      onPressed: () {},
    );
  }
}
