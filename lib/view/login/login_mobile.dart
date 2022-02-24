import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/router/router.dart';
import '../home/home_view.dart';
import 'component/instagram_image.dart';
import 'controller/login_cubit.dart';
import 'component/sign_up_row.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/email_text_field.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/password_text_field.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailedState) {
                showSnackBar(
                    msg: state.msg, snackBarStates: SnackBarStates.error);
              }
              if (state is LoginSuccessState) {
                showSnackBar(
                    msg: 'Login Successfully',
                    snackBarStates: SnackBarStates.success);
                MagicRouter.navigateAndPopAll(const HomeView());
              }
            },
            builder: (context, state) {
              final cubit = LoginCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    shrinkWrap: true,
                    children: [
                      const InstagramImage(),
                      const SizedBox(height: 64),
                      EmailTextField(
                          controller: cubit.emailController,
                          onFieldSubmitted: (_) =>
                              cubit.passwordFocusNode.requestFocus()),
                      const SizedBox(height: 24),
                      PasswordTextField(
                          controller: cubit.passwordController,
                          obscureText: cubit.isPassword,
                          onPressed: cubit.changePasswordVisibility,
                          icon: cubit.suffix,
                          focusNode: cubit.passwordFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                            cubit.loginWithEmail();
                          }),
                      const SizedBox(height: 24),
                      MainButton(
                        onPressed: () {
                          cubit.loginWithEmail();
                          FocusScope.of(context).unfocus();
                        },
                        child: state is LoginLoadingState
                            ? const LoadingWidget()
                            : const Text('Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                      ),
                      const SizedBox(height: 12),
                      const SignUpRow(),
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
