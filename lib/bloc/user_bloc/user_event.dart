part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class LoadingEvent extends UserEvent {}

final class ShowAllUsersEvent extends UserEvent {}
