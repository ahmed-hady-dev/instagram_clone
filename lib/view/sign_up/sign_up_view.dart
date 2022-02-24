import 'package:flutter/material.dart';
import '../../core/responsive_helper/responsive_layout.dart';
import 'sign_up_mobile.dart';
import 'sign_up_web.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ResponsiveLayout(
          mobilePortrait: SignUpMobile(),
          webScreen: SignUpWeb(),
        ),
      ),
    );
  }
}
