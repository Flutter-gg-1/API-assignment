part of 'userposts_bloc.dart';

@immutable
sealed class UserPostsEvent {}
final class GetUserPostsEvent extends UserPostsEvent {}