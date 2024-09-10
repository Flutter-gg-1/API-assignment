part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}

final class ChangePagesEvent extends NavEvent {
  final int index;
  ChangePagesEvent({required this.index});
}
