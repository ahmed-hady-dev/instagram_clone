import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/core/responsive_helper/responsive_layout.dart';
import 'package:instagram_clone/view/feed/component/messages_button.dart';
import 'package:instagram_clone/view/feed/widgets/post_card.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: width > kWebBreakPoint
            ? AppColors.webBackgroundColor
            : AppColors.mobileBackgroundColor,
        appBar: width > kWebBreakPoint ? null : buildAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(AppConstants.posts)
                  .orderBy('datePublished', descending: true)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                final userModel = HomeCubit.get(context).userModel;
                return userModel == null
                    ? const LoadingWidget()
                    : ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (ctx, index) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  width > kWebBreakPoint ? width * 0.3 : 0,
                              vertical: width > kWebBreakPoint ? 15 : 0),
                          child:
                              PostCard(snap: snapshot.data?.docs[index].data()),
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.mobileBackgroundColor,
      centerTitle: false,
      actions: const [MessagesButton()],
      title: SvgPicture.asset('assets/images/ic_instagram.svg',
          color: AppColors.primaryColor, height: 32),
    );
  }
}
