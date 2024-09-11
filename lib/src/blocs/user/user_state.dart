part of 'user_bloc.dart';

// @immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadState extends UserState {}

final class SuccessAllUsersState extends UserState {
  List<User> allUsers;
  SuccessAllUsersState(this.allUsers);
}

final class ErorrState extends UserState {
  String msg;
  ErorrState(this.msg);
}
