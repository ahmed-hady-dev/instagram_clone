import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/app_colors.dart';

class InstagramImage extends StatelessWidget {
  const InstagramImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/ic_instagram.svg',
        color: AppColors.primaryColor, height: 64.0);
  }
}
