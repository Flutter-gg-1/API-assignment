import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/photo_model.dart';
import '../../networking/api_mixin.dart';

part 'Photos_event.dart';
part 'Photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  ApiMixin api = ApiMixin();
  PhotosBloc() : super(PhotosInitial()) {
    on<ShowPhotosEvent>((event, emit) async {
      List<PhotosModel> allPhotos = await api.displayAllPhotos();
      emit(ShowPhotosState(allPhotos: allPhotos));
    });
  }
}
