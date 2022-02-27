import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/comments/comments_view.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class PostInfoColumn extends StatelessWidget {
  const PostInfoColumn({Key? key, required this.snap}) : super(key: key);
  final snap;
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${snap['likes'].length} likes',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w800)),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: AppColors.primaryColor),
                children: [
                  TextSpan(
                      text: snap['username'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' ${snap['description']}'),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'View all ${cubit.commentLen} comments',
                style: const TextStyle(
                    fontSize: 16, color: AppColors.secondaryColor),
              ),
            ),
            onTap: () => MagicRouter.navigateTo(
              BlocProvider.value(
                  value: HomeCubit.get(context),
                  child: CommentsView(postId: snap['postId'].toString())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              DateFormat.yMMMd().format(snap['datePublished'].toDate()),
              style: const TextStyle(color: AppColors.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
