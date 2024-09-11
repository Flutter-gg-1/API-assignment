part of 'Photos_bloc.dart';

@immutable
sealed class PhotosEvent {}

final class ShowPhotosEvent extends PhotosEvent {}
