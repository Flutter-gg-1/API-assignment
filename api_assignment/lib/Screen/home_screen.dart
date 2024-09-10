import 'package:api_assignment/bloc/nav_bloc.dart';
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
                  bloc.add(ChangePagesEvent(index:index));
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.verified_user),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_library),
                    label: 'Home',
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
