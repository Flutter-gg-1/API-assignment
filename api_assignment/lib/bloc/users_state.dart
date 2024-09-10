part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

class LoadingState extends UsersState {}

class ErrorState extends UsersState {
  final String msg;
  ErrorState({required this.msg});
}

class ShowUserState extends UsersState {
  final List<UserModel> listUser;
  ShowUserState( this.listUser);
}
