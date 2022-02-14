import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/login/controller/login_cubit.dart';
import 'package:instagram_clone/view/login/widgets/custom_text_field.dart';
import 'package:instagram_clone/view/sign_up/sign_up_view.dart';
import 'package:instagram_clone/widgets/email_text_field.dart';
import 'package:instagram_clone/widgets/password_text_field.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = LoginCubit.get(context);
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    SvgPicture.asset('assets/images/ic_instagram.svg',
                        color: AppColors.primaryColor, height: 64.0),
                    const SizedBox(height: 64),
                    EmailTextField(
                        controller: cubit.emailController,
                        onFieldSubmitted: (s) {}),
                    const SizedBox(height: 24),
                    PasswordTextField(
                        controller: cubit.passwordController,
                        onFieldSubmitted: (p0) {},
                        obscureText: cubit.isPassword,
                        onPressed: cubit.changePasswordVisibility,
                        icon: cubit.suffix),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      child: Container(
                        child: const Text('Log in'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: AppColors.blueColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            'Dont have an account?',
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        GestureDetector(
                          onTap: () =>
                              MagicRouter.navigateTo(const SignUpView()),
                          child: Container(
                            child: const Text(
                              ' Signup.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ],
                    ),
                    Text(MediaQuery.of(context).size.width.toString()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
