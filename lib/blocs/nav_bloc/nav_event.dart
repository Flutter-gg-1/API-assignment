part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}

final class ChangeEvent extends NavEvent {
  final int currentIndex;
  ChangeEvent({required this.currentIndex});
}
