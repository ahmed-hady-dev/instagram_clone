import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/view/feed/component/like_animation.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class PostImage extends StatelessWidget {
  const PostImage({Key? key, required this.snap}) : super(key: key);
  final snap;
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return GestureDetector(
      onDoubleTap: () {
        cubit.isLikeAnimating = true;
        cubit.likePost(
            postId: snap['postId'].toString(),
            uid: HomeCubit.get(context).userModel!.uid.toString(),
            likes: snap[AppConstants.likes]);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: snap['postUrl'].toString(),
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const LoadingWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: cubit.isLikeAnimating ? 1 : 0,
            child: LikeAnimation(
              isAnimating: cubit.isLikeAnimating,
              child: const Icon(Icons.favorite, color: Colors.white, size: 100),
              duration: const Duration(milliseconds: 400),
              onEnd: cubit.changeLikeAnimation,
            ),
          ),
        ],
      ),
    );
  }
}
