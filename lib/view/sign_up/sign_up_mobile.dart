import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/router/router.dart';
import '../home/home_view.dart';
import 'component/pick_image_avatar.dart';
import 'controller/signup_cubit.dart';
import 'component/login_row.dart';
import '../../widgets/bio_text_field.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/email_text_field.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/password_text_field.dart';
import '../../widgets/user_name_text_field.dart';

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
            listener: (context, state) {
              if (state is SignUpFailedState) {
                showSnackBar(
                    msg: state.msg, snackBarStates: SnackBarStates.error);
              }
              if (state is SignUpSuccessState) {
                showSnackBar(
                    msg: 'SignUp Successfully',
                    snackBarStates: SnackBarStates.success);
                MagicRouter.navigateAndPopAll(const HomeView());
              }
            },
            builder: (context, state) {
              final cubit = SignupCubit.get(context);
              void signUp() {
                FocusScope.of(context).unfocus();
                cubit.signUpWithEmail();
              }

              return Form(
                key: cubit.formKey,
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    shrinkWrap: true,
                    children: [
                      PickImageAvatar(
                          onPressed: cubit.pickProfileImage,
                          image: cubit.image),
                      const SizedBox(height: 64),
                      UserNameTextField(
                          controller: cubit.userNameController,
                          onFieldSubmitted: (_) =>
                              cubit.emailFocusNode.requestFocus()),
                      const SizedBox(height: 24),
                      EmailTextField(
                        controller: cubit.emailController,
                        focusNode: cubit.emailFocusNode,
                        onFieldSubmitted: (_) =>
                            cubit.passwordFocusNode.requestFocus(),
                      ),
                      const SizedBox(height: 24),
                      PasswordTextField(
                          controller: cubit.passwordController,
                          obscureText: cubit.isPassword,
                          onPressed: cubit.changePasswordVisibility,
                          focusNode: cubit.passwordFocusNode,
                          icon: cubit.suffix,
                          onFieldSubmitted: (_) =>
                              cubit.bioFocusNode.requestFocus()),
                      const SizedBox(height: 24),
                      BioTextField(
                          controller: cubit.bioController,
                          focusNode: cubit.bioFocusNode,
                          onFieldSubmitted: (_) => signUp()),
                      const SizedBox(height: 24),
                      MainButton(
                          onPressed: signUp,
                          child: state is SignUpLoadingState
                              ? const LoadingWidget()
                              : const Text('SignUp',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                      const SizedBox(height: 12),
                      const LoginRow(),
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
