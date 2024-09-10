part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class PhotoLoadState extends PhotoState {}

final class PhotoSuccessState extends PhotoState {}

final class PhotoErrorState extends PhotoState {}
