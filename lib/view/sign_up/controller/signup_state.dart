part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
//===============================================================

class SignUpLoadingState extends SignupState {}

class SignUpSuccessState extends SignupState {}

class SignUpFailedState extends SignupState {
  final String msg;
  SignUpFailedState({required this.msg});
}
//===============================================================

class RegisterChangePasswordVisibilityState extends SignupState {}
//===============================================================

class ProfileImagePickedSuccessState extends SignupState {}

class ProfileImagePickedFailedState extends SignupState {}
