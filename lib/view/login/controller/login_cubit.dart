import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
//===============================================================
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FocusNode passwordFocusNode = FocusNode();
//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  //===============================================================
  void loginWithEmail() async {
    emit(LoginLoadingState());
    try {
      if (!formKey.currentState!.validate()) {
        emit(LoginInitial());
        return;
      }
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim().toLowerCase(),
          password: passwordController.text.trim());
      print(userCredential.user);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(LoginFailedState(msg: e.toString()));
    }
  }

//===============================================================
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
