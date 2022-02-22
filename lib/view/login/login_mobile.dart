import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/login/controller/login_cubit.dart';
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
              return Form(
                key: cubit.formKey,
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    shrinkWrap: true,
                    children: [
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
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.blueColor, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {},
                            child: const Text('Log in')),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: const Text('Don\'t have an account?'),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8)),
                            GestureDetector(
                              onTap: () => MagicRouter.navigateAndPopAll(
                                  const SignUpView()),
                              child: Container(
                                  child: const Text(
                                    ' Signup.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
