import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/all_file.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  List<Widget> pages = [const Page1(), const Page2(), const Page3()];
  int currentIndex = 0;
  NavBloc() : super(NavInitial()) {
    on<ChangePagesEvent>(_changePages);
  }

  FutureOr<void> _changePages(ChangePagesEvent event, Emitter<NavState> emit) {
    currentIndex = event.index;
    emit(ChangePagesState());
  }
}
