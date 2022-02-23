import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/view/sign_up/model/user_model.dart';
import 'package:instagram_clone/widgets/custom_snack_bar.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
//===============================================================
  bool isPassword = true;
  Uint8List? image;
  IconData suffix = Icons.visibility_outlined;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _fireStorage = FirebaseStorage.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode(),
      bioFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      userNameController = TextEditingController(),
      bioController = TextEditingController();

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void signUpWithEmail() async {
    emit(SignUpLoadingState());
    try {
      if (!formKey.currentState!.validate()) {
        emit(SignupInitial());
        return;
      }
      String? photoUrl;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text.trim().toLowerCase(),
              password: passwordController.text.trim());
      if (image != null) {
        photoUrl = await uploadImageToStorage(
            childName: AppConstants.profilePics, file: image);
      }
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        email: emailController.text.trim().toLowerCase(),
        bio: bioController.text.trim(),
        name: userNameController.text.trim(),
        photoUrl: photoUrl ?? '',
        followers: [],
        following: [],
      );
      await _fireStore
          .collection(AppConstants.users)
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SignUpFailedState(msg: e.toString()));
    }
  }

  //===============================================================
  Future pickProfileImage() async {
    final picker = ImagePicker();
    XFile? _file = await picker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      image = await _file.readAsBytes();
      emit(ProfileImagePickedSuccessState());
      return await _file.readAsBytes();
    }
    showSnackBar(
        msg: 'there is no image selected',
        snackBarStates: SnackBarStates.error);
    emit(ProfileImagePickedFailedState());
  }

  //===============================================================
  Future<String> uploadImageToStorage({
    required String childName,
    Uint8List? file,
    bool isPost = false,
  }) async {
    Reference ref =
        _fireStorage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

//===============================================================
  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    bioController.dispose();
    emailController.dispose();
    bioFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}
