part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class PostLoadEvent extends PostEvent {}

final class PostSuccessEvent extends PostEvent {}

final class PostFailEvent extends PostEvent {}
