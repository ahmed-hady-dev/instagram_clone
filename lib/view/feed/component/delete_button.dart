import 'package:flutter/material.dart';
import 'package:instagram_clone/core/router/router.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
  }) : super(key: key);

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
                  onTap: () {
                    // deletePost(
                    //   snap['postId']
                    //       .toString(),
                    // );
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
