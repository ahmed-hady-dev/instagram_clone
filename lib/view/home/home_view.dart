import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/login/login_view.dart';
import 'package:instagram_clone/widgets/main_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: MainButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                MagicRouter.navigateAndPopAll(const LoginView());
              },
              child: Text('Signout', style: const TextStyle())),
        ),
      ),
    );
  }
}
