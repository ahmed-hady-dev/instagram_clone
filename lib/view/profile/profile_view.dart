import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/home/controller/home_cubit.dart';
import 'package:instagram_clone/view/login/login_view.dart';
import 'package:instagram_clone/widgets/main_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  HomeCubit.get(context).userModel?.toJson().toString() ??
                      'Loading',
                  style: const TextStyle()),
              MainButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    MagicRouter.navigateAndPopAll(const LoginView());
                  },
                  child: const Text('Sign Out', style: TextStyle())),
            ],
          ),
        ),
      ),
    );
  }
}
