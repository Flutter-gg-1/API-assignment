part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

final class PhotoLoadEvent extends PhotoEvent {}

final class PrevPageEvent extends PhotoEvent {}

final class NextPageEvent extends PhotoEvent {}

final class PhotoSuccessEvent extends PhotoEvent {}

final class PhotoFailEvent extends PhotoEvent {}
