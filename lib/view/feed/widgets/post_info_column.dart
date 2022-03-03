import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:intl/intl.dart';

import 'comments_row.dart';

class PostInfoColumn extends StatelessWidget {
  const PostInfoColumn({Key? key, required this.snap}) : super(key: key);
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${snap['likes'].length ?? 0} likes',
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
          CommentsRow(snap: snap),
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
