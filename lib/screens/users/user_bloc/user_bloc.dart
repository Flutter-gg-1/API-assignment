import 'dart:async';

import 'package:api_test/networking/networking_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final nwk = NetworkingApi();
  List<User> users = [];
  UserBloc() : super(UserInitial()) {
    on<UserLoadEvent>(loadData);
  }

  FutureOr<void> loadData(UserLoadEvent event, Emitter<UserState> emit) async {
    try {
      users = await nwk.fetchUsers();
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
