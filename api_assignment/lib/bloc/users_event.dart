part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class GetUserEvent extends UsersEvent{}

class GetPhotoEvent extends UsersEvent{}