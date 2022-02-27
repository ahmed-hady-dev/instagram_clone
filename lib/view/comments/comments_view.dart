import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/view/comments/widgets/comment_card.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({Key? key, this.postId}) : super(key: key);
  final postId;
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
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, index) => CommentCard(
                  snap: snapshot.data!.docs[index],
                ),
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
                      backgroundImage: CachedNetworkImageProvider(
                          cubit.userModel!.photoUrl.toString()),
                      radius: 18),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: TextField(
                        controller: cubit.commentController,
                        decoration: InputDecoration(
                          hintText: 'Comment as ${user.name}',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //   postComment(
                      //   user.uid,
                      //   user.username,
                      //   user.photoUrl,
                      // );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: const Text('Post',
                          style: TextStyle(color: Colors.blue)),
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
