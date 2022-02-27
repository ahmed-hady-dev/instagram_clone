import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/comments/comments_view.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class CommentsRow extends StatelessWidget {
  const CommentsRow({Key? key, this.snap}) : super(key: key);
  final snap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.posts)
                .doc(snap['postId'].toString())
                .collection('comments')
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data!.docs.isEmpty) {
                return const Text(
                  'View all 0 comments',
                  style:
                      TextStyle(fontSize: 16, color: AppColors.secondaryColor),
                );
              }
              return Text(
                'View all ${snapshot.data?.size.toString() ?? 0} comments',
                style: const TextStyle(
                    fontSize: 16, color: AppColors.secondaryColor),
              );
            }),
      ),
      onTap: () => MagicRouter.navigateTo(
        BlocProvider.value(
            value: HomeCubit.get(context),
            child: CommentsView(postId: snap['postId'].toString())),
      ),
    );
  }
}
