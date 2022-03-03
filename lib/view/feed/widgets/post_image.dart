import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/view/feed/component/like_animation.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class PostImage extends StatefulWidget {
  const PostImage({Key? key, required this.snap, required this.index})
      : super(key: key);
  final Map<String, dynamic> snap;
  final int index;
  @override
  State<PostImage> createState() => _PostImageState();
}

bool isLikeAnimating = false;

class _PostImageState extends State<PostImage> {
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return GestureDetector(
      onDoubleTap: () {
        // print(widget.snap.toString());
        print(widget.index);
        isLikeAnimating = true;
        cubit.likePost(
            postId: widget.snap['postId'].toString(),
            uid: HomeCubit.get(context).userModel!.uid.toString(),
            likes: widget.snap[AppConstants.likes]);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.snap['postUrl'].toString(),
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const LoadingWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isLikeAnimating ? 1 : 0,
            child: LikeAnimation(
              isAnimating: isLikeAnimating,
              child: const Icon(Icons.favorite, color: Colors.white, size: 100),
              duration: const Duration(milliseconds: 400),
              onEnd: () {
                isLikeAnimating = false;
                cubit.changeLikeAnimation();
              },
            ),
          ),
        ],
      ),
    );
  }
}
