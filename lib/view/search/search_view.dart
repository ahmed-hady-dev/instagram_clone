import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/view/search/posts_staggered_grid.dart';
import 'package:instagram_clone/view/search/search_resaults.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mobileBackgroundColor,
            title: Form(
              child: TextFormField(
                controller: cubit.searchController,
                decoration:
                    const InputDecoration(labelText: 'Search for a user...'),
                onFieldSubmitted: (String _) {
                  cubit.isShowUsers = true;
                  cubit.changeLikeAnimation();
                },
              ),
            ),
          ),
          body: cubit.isShowUsers
              ? const SearchResults()
              : const PostsStaggeredGrid(),
        );
      },
    );
  }
}
