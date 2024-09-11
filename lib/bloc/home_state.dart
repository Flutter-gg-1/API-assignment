part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ShowUserSucessfullyState extends HomeState {
  final List<UserModel> users;

  ShowUserSucessfullyState({required this.users});
}

final class ShowPhotoSucessfullyState extends HomeState {
  final List<PhotoModel> photos;

  ShowPhotoSucessfullyState({required this.photos});
}

final class ShowPostSucessfullyState extends HomeState {
  final List<PostModel> posts;

  ShowPostSucessfullyState({required this.posts});

}

final class LoadingState extends HomeState {}

final class ErrorState extends HomeState {
  final String msg;

  ErrorState({required this.msg});
}
