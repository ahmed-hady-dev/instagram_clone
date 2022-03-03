import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/view/feed/component/delete_button.dart';

class UserInfoRow extends StatelessWidget {
  final String? profileImage;
  final String userName;
  final String userUId;
  final String snapUId;
  final String postId;
  const UserInfoRow(
      {Key? key,
      required this.profileImage,
      required this.userName,
      required this.userUId,
      required this.postId,
      required this.snapUId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String defaultAvatar =
        'https://img.favpng.com/25/13/19/samsung-galaxy-a8-a8-user-login-telephone-avatar-png-favpng-dqKEPfX7hPbc6SMVUCteANKwj.jpg';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
          .copyWith(right: 0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
            backgroundImage:
                CachedNetworkImageProvider(profileImage ?? defaultAvatar),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          snapUId == userUId ? DeleteButton(postId: postId) : Container(),
        ],
      ),
    );
  }
}
