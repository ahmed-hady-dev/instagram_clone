part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

//===============================================================
class ChangePageNumber extends HomeState {}

//===============================================================
class ClearImageState extends HomeState {}

//===============================================================
class LikeAnimationState extends HomeState {}
//===============================================================

class ProfileImagePickedSuccessState extends HomeState {}

class ProfileImagePickedFailedState extends HomeState {}

//===============================================================

class CacheUserLoading extends HomeState {}

class CacheUserSuccess extends HomeState {}

class CacheUserFailed extends HomeState {}
//===============================================================

class GetUserDataLoading extends HomeState {}

class GetUserDataSuccess extends HomeState {}

class GetUserDataFailed extends HomeState {}
//===============================================================

class UploadPostLoading extends HomeState {}

class UploadPostSuccess extends HomeState {}

class UploadPostFailed extends HomeState {}
//===============================================================

class LikePostLoading extends HomeState {}

class LikePostSuccess extends HomeState {}

class LikePostFailed extends HomeState {}
//===============================================================

class AddCommentLoading extends HomeState {}

class AddCommentSuccess extends HomeState {}

class AddCommentFailed extends HomeState {}
//===============================================================

class DeletePostLoading extends HomeState {}

class DeletePostSuccess extends HomeState {}

class DeletePostFailed extends HomeState {}
