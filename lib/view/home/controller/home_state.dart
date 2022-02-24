part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

//===============================================================
class ChangePageNumber extends HomeState {}

//===============================================================
class ClearImageState extends HomeState {}
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
