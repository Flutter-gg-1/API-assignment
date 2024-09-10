part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class LoadPhotoState extends PhotoState {}

final class SuccessPhotoState extends PhotoState {
  final List<PhotoModel> listPhoto;
  SuccessPhotoState({required this.listPhoto});
}

final class ErrorState extends PhotoState {}
