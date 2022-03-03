import 'package:flutter/material.dart';
import 'package:instagram_clone/view/feed/widgets/background_container.dart';
import 'package:instagram_clone/view/feed/widgets/post_activity_row.dart';
import 'package:instagram_clone/view/feed/widgets/post_image.dart';
import 'package:instagram_clone/view/feed/widgets/post_info_column.dart';
import 'package:instagram_clone/view/feed/widgets/user_info_row.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.snap, required this.index})
      : super(key: key);
  final Map<String, dynamic> snap;
  final int index;
  @override
  Widget build(BuildContext context) {
    final user = HomeCubit.get(context).userModel;
    return BackgroundContainer(
      child: Column(
        children: [
          UserInfoRow(
              profileImage: snap['profImage'],
              userName: snap['username'].toString(),
              userUId: user!.uid!,
              postId: snap['postId'].toString(),
              snapUId: snap['uid'].toString()),
          PostImage(snap: snap, index: index),
          PostActivityRow(snap: snap),
          PostInfoColumn(snap: snap)
        ],
      ),
    );
  }
}
