part of 'photos_bloc.dart';

@immutable
sealed class PhotosEvent {}
final class GetPhotosEvent extends PhotosEvent {}
