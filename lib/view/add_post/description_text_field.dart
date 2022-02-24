import 'package:flutter/material.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextField(
          maxLines: 8,
          controller: controller,
          decoration: const InputDecoration(
              hintText: "Write a caption...", border: InputBorder.none),
        ));
  }
}
