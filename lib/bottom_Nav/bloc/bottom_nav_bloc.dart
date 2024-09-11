import 'dart:async';

import 'package:apiasswignment/src/firstscrean.dart';
import 'package:apiasswignment/src/pics.dart';
import 'package:apiasswignment/src/post.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  List<Widget> views = [
    Firstscrean(),
    PicsScreen(),
    PostScreen()
  ];
  int currentIndex = 0;
  BottomNavBloc() : super(BottomNavInitial()) {
    on<ChangeEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(ChangeEvent event, Emitter<BottomNavState> emit) {
    currentIndex = event.index;
    emit(SuccessChangeViewState());
  }
}
