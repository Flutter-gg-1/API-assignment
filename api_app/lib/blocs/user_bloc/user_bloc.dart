import 'dart:async';

import 'package:api_app/model/user_model.dart';
import 'package:api_app/networking/api_networking.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> listUser = [];
  final getAllUsers = ApiNetworking().getAllUsers();
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadUsersEvent>(LoadMethod);
  }

  FutureOr<void> LoadMethod(
      LoadUsersEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadUsersState());
      listUser = await getAllUsers;
      emit(SuccessUsersState(listUsers: listUser));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
