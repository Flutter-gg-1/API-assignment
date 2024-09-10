part of 'users_block_bloc.dart';

@immutable
sealed class UsersBlockEvent {}

final class GetUserEvent extends UsersBlockEvent {}
