import 'package:apiasswignment/Models/user.dart';
import 'package:apiasswignment/network/api_networking.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  ApiNetworking apiNetworking;
  UsersBloc(this.apiNetworking) : super(UsersInitial()) {
    on<UsersEvent>((event, emit) {});

    on<GetUserData>((event, emit) async {
      try {
        emit(UserLoadingState());
        final users = await apiNetworking.getallusers();
        emit(UserloadedState(users: users));
      } catch (e) {
        emit(UserErrorState(message: e.toString()));
      }
    });
  }
}
