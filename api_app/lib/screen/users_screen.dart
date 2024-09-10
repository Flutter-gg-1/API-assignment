import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc/user_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<UserBloc>();
        bloc.add(LoadUsersEvent());

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "List of Users",
                  style: TextStyle(color: Colors.blue, fontSize: 40),
                ),
                Center(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is ErrorState) {
                        return const Text("Error when fetched data!");
                      }
                      if (state is LoadUsersState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is SuccessUsersState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            itemCount: state.listUsers.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const CircleAvatar(
                                    child: Icon(Icons.person)),
                                title: Text(state.listUsers[index].name),
                                subtitle: Text(state.listUsers[index].email),
                              );
                            },
                          ),
                        );
                      }
                      return const Text("No data fetched!");
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
