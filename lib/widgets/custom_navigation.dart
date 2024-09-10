import 'package:api_assignment/blocs/nav_bloc/nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<NavBloc>();
        return BlocBuilder<NavBloc, NavState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  bloc.pageTitles[bloc.pageIndex],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: bloc.pages[bloc.pageIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color.fromARGB(255, 22, 57, 87),
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.blue,
                currentIndex: bloc.pageIndex,
                onTap: (currentIndex) {
                  if (bloc.pageIndex != currentIndex) {
                    bloc.add(ChangeEvent(currentIndex: currentIndex));
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Users',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.image_rounded),
                    label: 'Photos',
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
