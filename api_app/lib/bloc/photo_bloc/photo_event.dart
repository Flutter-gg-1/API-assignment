part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

final class LoadPhotoEvent extends PhotoEvent {}
