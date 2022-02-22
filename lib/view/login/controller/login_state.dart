part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

//===============================================================
class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {
  final String msg;

  LoginFailedState({required this.msg});
}

//===============================================================
class LoginChangePasswordVisibilityState extends LoginState {}
