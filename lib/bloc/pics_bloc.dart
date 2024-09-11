import 'package:apiasswignment/Models/Pics.dart';
import 'package:apiasswignment/network/api_pics_network.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'pics_event.dart';
part 'pics_state.dart';

class PicsBloc extends Bloc<PicsEvent, PicsState> {
  ApiPicsNetwork apiNetworking;

  PicsBloc(this.apiNetworking) : super(PicsInitial()) {
    on<PicsEvent>((event, emit) async {
      try {
        emit(PicsLoadingState());
        final picss = await apiNetworking.getallPicss();
        emit(PicsloadedState(picss: picss));
      } catch (e) {
        emit(PicsErrorState(message: e.toString()));
      }
    });
  }
}
