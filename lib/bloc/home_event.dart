part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ShowUserEvent extends HomeEvent{}
class ShowPhotoEvent extends HomeEvent{}