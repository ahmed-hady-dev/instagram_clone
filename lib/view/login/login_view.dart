import 'package:flutter/material.dart';
import 'package:instagram_clone/core/responsive_helper/responsive_layout.dart';

import 'login_mobile.dart';
import 'web_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ResponsiveLayout(
          mobilePortrait: LoginMobile(),
          webScreen: LoginWeb(),
        ),
      ),
    );
  }
}
