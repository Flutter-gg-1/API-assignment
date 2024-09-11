import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:train8/src/models/users/user_model.dart';
import 'package:train8/src/networking/api_networking.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final api = ApiNetworking();
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});

    on<FetchAllUsersEvent>((event, emit) async {
      try {
        emit(UserLoadState());
        final List<User> allUsers = await api.getAllUsers();
        emit(SuccessAllUsersState(allUsers));
      } catch (Error) {
        emit(ErorrState(Error.toString()));
      }
    });
  }
}
