import 'package:flutter/material.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.postId,
  }) : super(key: key);
  final String postId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          useRootNavigator: false,
          context: context,
          builder: (context) {
            return Dialog(
              child: InkWell(
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Text('Delete')),
                  onTap: () async {
                    await HomeCubit().deletePost(postId: postId);
                    MagicRouter.pop();
                  }),
            );
          },
        );
      },
      icon: const Icon(Icons.more_vert),
    );
  }
}
