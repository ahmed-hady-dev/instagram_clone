import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/app_colors.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/login/login_view.dart';
import 'package:instagram_clone/view/sign_up/controller/signup_cubit.dart';
import 'package:instagram_clone/widgets/bio_text_field.dart';
import 'package:instagram_clone/widgets/email_text_field.dart';
import 'package:instagram_clone/widgets/password_text_field.dart';
import 'package:instagram_clone/widgets/user_name_text_field.dart';

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) => SignupCubit(),
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = SignupCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            cubit.image == null
                                ? const CircleAvatar(
                                    radius: 64,
                                    backgroundImage: NetworkImage(
                                        'https://i.stack.imgur.com/l60Hf.png'),
                                    backgroundColor: Colors.grey,
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    backgroundImage: MemoryImage(cubit.image!),
                                    backgroundColor: Colors.grey,
                                  ),
                            Positioned(
                              bottom: -10,
                              left: 80,
                              child: IconButton(
                                onPressed: cubit.pickProfileImage,
                                icon: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mobileBackgroundColor),
                                    child: const Icon(Icons.add_a_photo,
                                        size: 20.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(height: 64),
                      UserNameTextField(
                          controller: cubit.userNameController,
                          onFieldSubmitted: (p0) {}),
                      const SizedBox(height: 24),
                      EmailTextField(controller: cubit.emailController),
                      const SizedBox(height: 24),
                      PasswordTextField(
                          controller: cubit.passwordController,
                          obscureText: cubit.isPassword,
                          onPressed: cubit.changePasswordVisibility,
                          icon: cubit.suffix),
                      const SizedBox(height: 24),
                      BioTextField(
                          controller: cubit.bioController,
                          onFieldSubmitted: (p0) {}),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.blueColor, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {},
                            child: const Text('Sign up')),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: const Text('already have an account?'),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8)),
                            GestureDetector(
                              onTap: () => MagicRouter.navigateAndPopAll(
                                  const LoginView()),
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(' Login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
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
