import 'dart:async';

import 'package:api_assignment/models/users_model/user_model.dart';
import 'package:api_assignment/networking/networking_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_block_event.dart';
part 'users_block_state.dart';

class UsersBlockBloc extends Bloc<UsersBlockEvent, UsersBlockState> {
  final NetworkingApi api = NetworkingApi();
  List<UserModel> list = [];

  UsersBlockBloc() : super(UsersBlockInitial()) {
    on<UsersBlockEvent>((event, emit) {});
    on<GetUserEvent>(getUserMethod);
  }

  FutureOr<void> getUserMethod(
      GetUserEvent event, Emitter<UsersBlockState> emit) async {
    try {
      emit(LoadingState());
      list = await api.getAllUsers();
      emit(SuccessState(users: list));
    } catch (error) {
      emit(ErrorState(msg: "Something wents wrong"));
    }
  }
}
