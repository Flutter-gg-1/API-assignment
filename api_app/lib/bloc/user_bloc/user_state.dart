part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class LoadUsersState extends UserState {}

final class SuccessUsersState extends UserState {
  final List<UserModel> listUsers;
  SuccessUsersState({required this.listUsers});
}

final class ErrorState extends UserState {}
