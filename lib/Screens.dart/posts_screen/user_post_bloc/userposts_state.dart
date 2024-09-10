part of 'userposts_bloc.dart';

@immutable
sealed class UserPostsState {}

final class UserPostsInitial extends UserPostsState {}
final class LoadPostsInitial extends UserPostsState {}
final class SuccessPostsInitial extends UserPostsState {
  final List<PostModel> posts;
  SuccessPostsInitial({required this.posts});
}
final class ErrorPostsInitial extends UserPostsState {
  final String msg;
  ErrorPostsInitial({required this.msg});
}
