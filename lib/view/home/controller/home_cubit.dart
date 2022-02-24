import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/router/router.dart';
import 'package:instagram_clone/view/add_post/add_post_view.dart';
import 'package:instagram_clone/view/add_post/model/post_model.dart';
import 'package:instagram_clone/view/feed/feed_view.dart';
import 'package:instagram_clone/view/profile/profile_view.dart';
import 'package:instagram_clone/view/search/search_view.dart';
import 'package:uuid/uuid.dart';
import '../../../constants/constants.dart';
import '../../../core/getStorageCacheHelper/get_storage_cache_helper.dart';
import '../../sign_up/model/user_model.dart';
import '../../../widgets/custom_snack_bar.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
  int index = 0;
  Uint8List? file;
  UserModel? userModel;
  PageController pageController = PageController();
  final firestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;
  final FirebaseStorage fireStorage = FirebaseStorage.instance;
  final TextEditingController descriptionController = TextEditingController();
  List<Widget> homeScreenItems = [
    const FeedView(),
    const SearchView(),
    const AddPostView(),
    const Center(child: Text('notifications')),
    const ProfileView(),
  ];
//===============================================================
  void changePage({required int page}) {
    index = page;
    pageController.jumpToPage(page);
    emit(ChangePageNumber());
  }

//===============================================================
  Future<UserModel?> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final user = await firestore
          .collection(AppConstants.users)
          .doc(firebaseUser!.uid)
          .get();
      userModel = UserModel.fromJson(user.data()!);
      emit(GetUserDataSuccess());
      return userModel;
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      showSnackBar(msg: e.code, snackBarStates: SnackBarStates.error);
      emit(CacheUserFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      showSnackBar(msg: e.toString(), snackBarStates: SnackBarStates.error);
      emit(GetUserDataFailed());
    }
  }

//===============================================================

  Future<void> getAndCacheUserData() async {
    emit(CacheUserLoading());
    try {
      final userModel = await getUserData();
      CacheHelper.cacheUserData(userModel: userModel!);
      emit(CacheUserSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      showSnackBar(msg: e.code, snackBarStates: SnackBarStates.error);
      emit(CacheUserFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      showSnackBar(msg: e.toString(), snackBarStates: SnackBarStates.error);
      emit(CacheUserFailed());
    }
  }

//===============================================================
  pickImage({required ImageSource source}) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      emit(ProfileImagePickedSuccessState());
      return await _file.readAsBytes();
    }
    showSnackBar(
        msg: 'there is no image selected',
        snackBarStates: SnackBarStates.error);
    emit(ProfileImagePickedFailedState());
  }

//===============================================================
  void selectImage() async => showDialog(
        context: MagicRouter.currentContext!,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Create a Post'),
            children: <Widget>[
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Take a photo'),
                  onPressed: () async {
                    Navigator.pop(context);
                    file = await pickImage(source: ImageSource.camera);
                  }),
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Choose from Gallery'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    file = await pickImage(source: ImageSource.gallery);
                  }),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );

//===============================================================
  clearImage() {
    file = null;
    emit(ClearImageState());
  }

//===============================================================
  Future<String> uploadImageToStorage() async {
    Reference ref =
        fireStorage.ref().child(AppConstants.posts).child(firebaseUser!.uid);
    String id = const Uuid().v1();
    ref = ref.child(id);
    UploadTask uploadTask = ref.putData(file!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

//===============================================================
  Future<void> uploadPost() async {
    emit(UploadPostLoading());
    try {
      String photoUrl = await uploadImageToStorage();
      String postId = const Uuid().v1();
      PostModel post = PostModel(
          description: descriptionController.text.trim(),
          uid: firebaseUser!.uid,
          username: userModel!.name.toString(),
          likes: [],
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: userModel!.photoUrl.toString());
      firestore.collection(AppConstants.posts).doc(postId).set(post.toJson());
      emit(UploadPostSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.code.toString());
      showSnackBar(
          msg: e.code.toString(), snackBarStates: SnackBarStates.error);
      emit(UploadPostFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      showSnackBar(msg: e.toString(), snackBarStates: SnackBarStates.error);
      emit(UploadPostFailed());
    }
  }

//===============================================================
  @override
  Future<void> close() {
    pageController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
