import 'dart:async';

import 'package:api_app/model/photo_model.dart';
import 'package:api_app/networking/api_networking.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final getPhotos = ApiNetworking().getTenPhotos();
  List<PhotoModel> photoList = [];
  PhotoBloc() : super(PhotoInitial()) {
    on<PhotoEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadPhotoEvent>(photoMethod);
  }

  FutureOr<void> photoMethod(
      LoadPhotoEvent event, Emitter<PhotoState> emit) async {
    try {
      emit(LoadPhotoState());
      photoList = await getPhotos;
      emit(SuccessPhotoState(listPhoto: photoList));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
