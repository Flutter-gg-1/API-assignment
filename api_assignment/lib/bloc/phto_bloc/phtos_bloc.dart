import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phtos_event.dart';
part 'phtos_state.dart';

class PhtosBloc extends Bloc<PhtosEvent, PhtosState> {
  PhtosBloc() : super(PhtosInitial()) {
    on<PhtosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
