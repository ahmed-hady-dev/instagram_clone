import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/widgets/custom_toast.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
//===============================================================
  bool isPassword = true;
  Uint8List? image;
  final picker = ImagePicker();
  IconData suffix = Icons.visibility_outlined;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
//   Future<String> signUpUser({required Uint8List file}) async {
//     UserCredential credential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim().toString(),
//         password: passwordController.text.trim().toString());
//     print(credential.user!.email.toString());
//     await _fireStore.collection('users').doc(credential.user!.uid).set({
//       'bio': bioController.text.trim().toString(),
//       'email': emailController.text.trim().toString(),
//       'uid': credential.user!.uid,
//       'userName': userNameController.text.trim().toString(),
//       'followers': [],
//       'following': [],
//     });
//   }

  //===============================================================
  Future pickProfileImage() async {
    XFile? _file = await picker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    showToast(msg: 'there is no image selected', state: ToastedStates.error);
  }

//===============================================================
  @override
  Future<void> close() {
    passwordController.dispose();
    bioController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
