part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}
final class SuccessfullCommentState extends PostState {
  final List<Comment> comments;
  SuccessfullCommentState({required this.comments});
}
final class ErrorState extends PostState {}
