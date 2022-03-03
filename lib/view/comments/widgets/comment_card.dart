import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key, required this.snap}) : super(key: key);
  final QueryDocumentSnapshot<Map<String, dynamic>> snap;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
                radius: 18,
                backgroundImage:
                    CachedNetworkImageProvider(snap.data()['profilePic'])),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: snap.data()['name'],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' ${snap.data()['text']}')
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                          DateFormat.yMMMd()
                              .format(snap.data()['datePublished'].toDate()),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
