import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/core/responsive_helper/responsive_layout.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class PostsStaggeredGrid extends StatelessWidget {
  const PostsStaggeredGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('posts')
          .orderBy('datePublished')
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        }
        return StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Image.network(
              (snapshot.data! as dynamic).docs[index]['postUrl'],
              fit: BoxFit.cover),
          staggeredTileBuilder: (index) =>
              MediaQuery.of(context).size.width > kWebBreakPoint
                  ? StaggeredTile.count(
                      (index % 7 == 0) ? 1 : 1, (index % 7 == 0) ? 1 : 1)
                  : StaggeredTile.count(
                      (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        );
      },
    );
  }
}
