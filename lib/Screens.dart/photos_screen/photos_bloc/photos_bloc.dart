import 'dart:async';

import 'package:api_assignment/models/photo_model/photo_model.dart';
import 'package:api_assignment/networking/networking_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final NetworkingApi api = NetworkingApi();
  List<PhotoModel> list = [];
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosEvent>((event, emit) {});
    on<GetPhotosEvent>(getPhotosMethod);
  }
  FutureOr<void> getPhotosMethod(
      GetPhotosEvent event, Emitter<PhotosState> emit) async {
    try {
      emit(LoadPhotosState());
      list = await api.getAllPhotos();
      emit(SuccessPhotosState(photos: list));
    } catch (error) {
      emit(ErrorPhotosState(msg: "Something wents wrong"));
    }
  }
}
