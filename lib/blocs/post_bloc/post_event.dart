part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class DisplayComments extends PostEvent {
  final List<Comment> comments;
  DisplayComments({required this.comments});
}
