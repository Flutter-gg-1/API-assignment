import 'package:api_assignment/screens/photos_screen.dart';
import 'package:api_assignment/screens/users_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  List<Widget> pages = [const UsersScreen(), const PhotosScreen()];
  List<String> pageTitles = ['Users', 'Photos'];
  int pageIndex = 0;
  NavBloc() : super(NavInitial()) {
    on<ChangeEvent>((event, emit) {
      pageIndex = event.currentIndex;
      emit(SuccessfullChangeState());
    });
  }
}
