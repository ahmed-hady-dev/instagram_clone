import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/responsive_helper/responsive_layout.dart';
import 'controller/home_cubit.dart';
import 'home_mobile.dart';
import 'home_web.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getAndCacheUserData(),
        child: const Scaffold(
          body: ResponsiveLayout(
            mobilePortrait: HomeMobile(),
            webScreen: HomeWeb(),
          ),
        ),
      ),
    );
  }
}
