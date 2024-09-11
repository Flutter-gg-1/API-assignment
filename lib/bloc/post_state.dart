part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostloadedState extends PostState {
  final List<Post> posts;

  PostloadedState({required this.posts});
}

class PostErrorState extends PostState {
  final String message;

  PostErrorState({required this.message});
}
