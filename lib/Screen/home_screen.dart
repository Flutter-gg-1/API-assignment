import 'package:api_assignment/bloc/nav_bloc/nav_bloc.dart';
import 'package:api_assignment/core/all_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBloc(),
      child: Builder(builder: (context) {
        final bloc = BlocProvider.of<NavBloc>(context);
        return BlocBuilder<NavBloc, NavState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: bloc.currentIndex,
                onTap: (index) {
                  bloc.add(ChangePagesEvent(index: index));
                },
                backgroundColor: AppColor.primaryColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white38,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.verified_user),
                    label: 'User',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo),
                    label: 'Photos',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_library),
                    label: 'Photos By User Id',
                  ),
                ],
              ),
              body: bloc.pages.elementAt(bloc.currentIndex),
            );
          },
        );
      }),
    );
  }
}
