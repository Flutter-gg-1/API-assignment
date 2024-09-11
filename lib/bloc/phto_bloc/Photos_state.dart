part of 'Photos_bloc.dart';

@immutable
sealed class PhotosState {}

final class PhotosInitial extends PhotosState {}

final class ShowPhotosState extends PhotosState {
   List<PhotosModel> allPhotos = [];
  ShowPhotosState({required this.allPhotos});
}

final class ShowPhotosByUserIdState extends PhotosState {
  final int userId;
  ShowPhotosByUserIdState({required this.userId});
}
