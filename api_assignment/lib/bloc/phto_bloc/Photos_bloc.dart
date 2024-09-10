import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Photos_event.dart';
part 'Photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
