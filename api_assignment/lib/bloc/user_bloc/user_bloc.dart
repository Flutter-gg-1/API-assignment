import 'package:api_assignment/model/user/user_model.dart';
import 'package:api_assignment/networking/api_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  ApiMixin api = ApiMixin();

  UserBloc() : super(UserInitial()) {
    on<ShowAllUsersEvent>((event, emit) async {
      List<UserModel> allUsers = await api.displayAllUsers();
      emit(ShowAllUsersState(allUsers: allUsers));
    });
  }
}
