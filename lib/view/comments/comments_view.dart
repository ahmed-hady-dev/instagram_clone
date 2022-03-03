import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/comments/widgets/comment_card.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({Key? key, required this.postId}) : super(key: key);
  final String postId;
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    final user = cubit.userModel!;
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: Scaffold(
          appBar: AppBar(
              centerTitle: false,
              backgroundColor: AppColors.mobileBackgroundColor,
              title: const Text('Comments')),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.posts)
                .doc(postId)
                .collection(AppConstants.comments)
                .orderBy('datePublished')
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text('There is no comments on this post'));
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, index) =>
                    CommentCard(snap: snapshot.data!.docs[index]),
              );
            },
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              height: kToolbarHeight,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 18,
                      backgroundImage: CachedNetworkImageProvider(
                          cubit.userModel!.photoUrl.toString())),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: TextField(
                        controller: cubit.commentController,
                        onSubmitted: (_) async {
                          await cubit.postComment(postId: postId);
                          Focus.of(MagicRouter.currentContext!).unfocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Comment as ${user.name}'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await cubit.postComment(postId: postId);
                      Focus.of(MagicRouter.currentContext!).unfocus();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Text('Post', style: TextStyle(color: Colors.blue)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
