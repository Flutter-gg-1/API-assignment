part of 'users_block_bloc.dart';

@immutable
sealed class UsersBlockState {}

final class UsersBlockInitial extends UsersBlockState {}

final class LoadingState extends UsersBlockState {}

final class SuccessState extends UsersBlockState {
  final List<UserModel> users;
  SuccessState({required this.users});
}

final class ErrorState extends UsersBlockState {
  final String msg;
  ErrorState({required this.msg});
}
