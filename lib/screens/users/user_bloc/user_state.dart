part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadState extends UserState {}

final class SuccessState extends UserState {}

final class ErrorState extends UserState {}
