part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class ShowphotosListState extends PhotoState {
  final List<Photos> listphotos;
  ShowphotosListState(this.listphotos);
}

final class ErrorphotoListState extends PhotoState {
  final String msg;
  ErrorphotoListState(this.msg);
}

final class LoadphotoListState extends PhotoState {

}
