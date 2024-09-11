part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

class UserLoadingState extends UsersState {}

class UserloadedState extends UsersState {
  final List<User> users;

  UserloadedState({required this.users});
}

class UserErrorState extends UsersState {
  final String message;

  UserErrorState({required this.message});
}
