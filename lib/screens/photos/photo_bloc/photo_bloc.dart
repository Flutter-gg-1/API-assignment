import 'dart:async';

import 'package:api_test/networking/networking_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/photo.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final nwk = NetworkingApi();
  List<Photo> photos = [];
  var start = 0;
  var limit = 10;

  PhotoBloc() : super(PhotoInitial()) {
    on<PhotoLoadEvent>(loadData);
    on<PrevPageEvent>(prevPage);
    on<NextPageEvent>(nextPage);
  }

  Future<void> loadData(PhotoLoadEvent event, Emitter<PhotoState> emit) async {
    try {
      await fetchData();
      emit(PhotoSuccessState());
    } catch (e) {
      emit(PhotoErrorState());
    }
  }

  FutureOr<void> nextPage(NextPageEvent event, Emitter<PhotoState> emit) async {
    start += 10;
    await fetchData();
    emit(PhotoSuccessState());
  }

  FutureOr<void> prevPage(PrevPageEvent event, Emitter<PhotoState> emit) async {
    if (start == 0) {
      emit(PhotoErrorState());
    } else {
      start -= 10;
      await fetchData();
      emit(PhotoSuccessState());
    }
  }

  Future<void> fetchData() async =>
      photos = await nwk.fetchPhotos(params: getPhotosParams(start, limit));

  String getPhotosParams(int? start, int? limit) {
    var result = '';
    result += (start == null) ? '' : '_start=$start&';
    result += (limit == null) ? '' : '_limit=$limit';
    result = '?$result'.trim();
    return result;
  }
}
