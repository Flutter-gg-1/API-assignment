part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class UserLoadEvent extends UserEvent {}

final class SuccessEvent extends UserEvent {}

final class FailEvent extends UserEvent {}
