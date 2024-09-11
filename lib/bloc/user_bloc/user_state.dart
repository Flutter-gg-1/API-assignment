part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class LoadingState extends UserState {}

final class ShowAllUsersState extends UserState {
  final List<UserModel> allUsers;
  ShowAllUsersState({required this.allUsers});
}
