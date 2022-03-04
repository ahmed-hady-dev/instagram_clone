import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/view/profile/profile_view.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String defaultAvatar =
        'https://img.favpng.com/25/13/19/samsung-galaxy-a8-a8-user-login-telephone-avatar-png-favpng-dqKEPfX7hPbc6SMVUCteANKwj.jpg';
    final cubit = HomeCubit.get(context);
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('users')
          .where(
            'name',
            isGreaterThanOrEqualTo: cubit.searchController.text,
          )
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        }
        if (snapshot.data == null) {
          return const LoadingWidget();
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => MagicRouter.navigateTo(BlocProvider.value(
                value: cubit,
                child: const ProfileView(
                    // uid: (snapshot.data! as dynamic).docs[index]['uid'],
                    ),
              )),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      (snapshot.data as dynamic).docs[index]['photoUrl'] ??
                          defaultAvatar),
                ),
                title: Text(
                  (snapshot.data! as dynamic).docs[index]['name'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
