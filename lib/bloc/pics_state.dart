part of 'pics_bloc.dart';

@immutable
sealed class PicsState {}

final class PicsInitial extends PicsState {}

class PicsLoadingState extends PicsState {}

class PicsloadedState extends PicsState {
  final List<Pics> picss;

  PicsloadedState( {required this.picss});
}


class PicsErrorState extends PicsState {
  final String message;

  PicsErrorState({required this.message});
}
