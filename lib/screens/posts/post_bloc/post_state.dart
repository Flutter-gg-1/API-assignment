part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoadState extends PostState {}

final class PostSuccessState extends PostState {}

final class PostErrorState extends PostState {
  final String msg;

  PostErrorState({required this.msg});
}
