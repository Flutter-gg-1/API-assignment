part of 'userposts_bloc.dart';

@immutable
sealed class UserPostsState {}

final class UserPostsInitial extends UserPostsState {}
final class LoadPostsState extends UserPostsState {}
final class SuccessPostsState extends UserPostsState {
  final List<PostModel> posts;
  SuccessPostsState({required this.posts});
}
final class ErrorPostsState extends UserPostsState {
  final String msg;
  ErrorPostsState({required this.msg});
}
