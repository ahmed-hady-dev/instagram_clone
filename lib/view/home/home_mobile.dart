import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'controller/home_cubit.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                children: cubit.homeScreenItems,
                controller: cubit.pageController,
                onPageChanged: (value) => cubit.changePage(page: value)),
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: AppColors.mobileBackgroundColor,
              onTap: (value) => cubit.changePage(page: value),
              currentIndex: cubit.index,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,
                        color: (cubit.index == 0)
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor),
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search,
                        color: (cubit.index == 1)
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor),
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle,
                        color: (cubit.index == 2)
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor),
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite,
                        color: (cubit.index == 3)
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor),
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person,
                        color: (cubit.index == 4)
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor),
                    backgroundColor: AppColors.primaryColor),
              ],
            ),
          );
        },
      ),
    );
  }
}
