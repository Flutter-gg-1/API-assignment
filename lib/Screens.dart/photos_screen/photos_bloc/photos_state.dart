part of 'photos_bloc.dart';

@immutable
sealed class PhotosState {}

final class PhotosInitial extends PhotosState {}

final class LoadPhotosState extends PhotosState {}

final class SuccessPhotosState extends PhotosState {
  final List<PhotoModel> photos;
  SuccessPhotosState({required this.photos});
}

final class ErrorPhotosState extends PhotosState {
  final String msg;
  ErrorPhotosState({required this.msg});
}
