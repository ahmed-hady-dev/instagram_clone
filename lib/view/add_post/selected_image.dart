import 'dart:typed_data';

import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: 45.0,
      child: AspectRatio(
        aspectRatio: 487 / 451,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              alignment: FractionalOffset.topCenter,
              image: MemoryImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
