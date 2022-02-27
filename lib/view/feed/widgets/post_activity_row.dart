import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/comments/comments_view.dart';
import 'package:instagram_clone/view/feed/component/like_animation.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class PostActivityRow extends StatelessWidget {
  const PostActivityRow({Key? key, required this.snap}) : super(key: key);
  final snap;
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    final user = cubit.userModel;
    return Row(
      children: <Widget>[
        LikeAnimation(
          isAnimating: snap['likes'].contains(user!.uid),
          smallLike: true,
          child: IconButton(
            icon: snap['likes'].contains(user.uid)
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border),
            onPressed: () async => await cubit.likePost(
                postId: snap['postId'].toString(),
                uid: user.uid.toString(),
                likes: snap[AppConstants.likes]),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.comment_outlined),
          onPressed: () => MagicRouter.navigateTo(
            BlocProvider.value(
                value: HomeCubit.get(context),
                child: CommentsView(postId: snap['postId'].toString())),
          ),
        ),
        IconButton(icon: const Icon(Icons.send), onPressed: () {}),
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        ))
      ],
    );
  }
}
