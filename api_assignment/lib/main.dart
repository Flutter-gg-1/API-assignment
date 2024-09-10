import 'package:api_assignment/bloc/users_bloc.dart';
import 'package:api_assignment/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
        create: (context) => UsersBloc(),
        child: BottomNavScreen(),
      ),
    );
  }
}
