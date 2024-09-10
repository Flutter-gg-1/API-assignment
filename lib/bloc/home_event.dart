part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ShowUserEvent extends HomeEvent{}
class ShowPhotoEvent extends HomeEvent{
  final int quantity;

  ShowPhotoEvent({required this.quantity});
}
class ShowPostEvent extends HomeEvent{
  final int id;

  ShowPostEvent({required this.id});
}