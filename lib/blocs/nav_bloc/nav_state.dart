part of 'nav_bloc.dart';

@immutable
sealed class NavState {}

final class NavInitial extends NavState {}

final class SuccessfullChangeState extends NavState {}

final class ErrorState extends NavState {}
