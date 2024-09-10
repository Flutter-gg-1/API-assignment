part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class LoadPostState extends PostState {}

final class SuccessPostState extends PostState {
  final List<PostModel> listPosts;
  SuccessPostState({required this.listPosts});
}

final class ErrorState extends PostState {}
