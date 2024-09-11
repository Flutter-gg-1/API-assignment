import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:train8/src/models/photos/photos_model.dart';
import 'package:train8/src/networking/api_networking.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final ApiNetworking api = ApiNetworking();

  PhotoBloc() : super(PhotoInitial()) {
    on<PhotoEvent>((event, emit) {});

    on<getphotoEvent>((event, emit) async {
      try {
        emit(LoadphotoListState());
        List<Photos> List1 = await api.getAllPhotos();

        emit(ShowphotosListState(List1));
      } catch (error) {
        emit(ErrorphotoListState("somthing went wrong "));
      }
    });
  }
}
