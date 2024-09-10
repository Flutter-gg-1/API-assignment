import 'dart:async';

import 'package:api_assignment/views/all_users_view.dart';
import 'package:api_assignment/views/one_user_view.dart';
import 'package:api_assignment/views/photo_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  List<Widget> views = [AllUsersView(), PhotoView(), OneUserView()];
  int currentIndex = 2;
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeEvent>(ChangeMethod);
  }

  FutureOr<void> ChangeMethod(ChangeEvent event, Emitter<BottomNavState> emit) {
    currentIndex = event.index;
    emit(SuccessChangeViewState());
  }
}
