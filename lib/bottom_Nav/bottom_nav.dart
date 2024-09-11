import 'package:apiasswignment/bottom_Nav/bloc/bottom_nav_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<BottomNavBloc>();
        return BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: bloc.currentIndex,
                  onTap: (value) {
                    bloc.add(ChangeEvent(index: value));
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Settings"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_2_outlined), label: "Profile")
                  ]),
              body: bloc.views[bloc.currentIndex],
            );
          },
        );
      }),
    );
  }
}
