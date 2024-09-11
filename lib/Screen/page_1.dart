import 'package:api_assignment/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Builder(builder: (context) {
        final bloc = BlocProvider.of<UserBloc>(context);
        bloc.add(ShowAllUsersEvent());
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 160, 138, 71),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is ShowAllUsersState) {
                return ListView(
                    children: List.generate(
                  bloc.api.allUsers.length,
                  (index) => Card(
                    child: ListTile(
                      title: Text(bloc.api.allUsers[index].name),
                      subtitle: Text(bloc.api.allUsers[index].username),
                      leading: Text(bloc.api.allUsers[index].id.toString()),
                      trailing: Text(bloc.api.allUsers[index].phone),
                    ),
                  ),
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      }),
    );
  }
}
