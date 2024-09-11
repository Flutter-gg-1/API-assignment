import 'package:apiasswignment/bloc/users_bloc.dart';
import 'package:apiasswignment/network/api_networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Firstscrean extends StatelessWidget {
  Firstscrean({super.key});
  final futureApi = ApiNetworking();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(futureApi)..add(GetUserData()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Users list'),
          ),
          body: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserloadedState) {
                final users = state.users;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                );
              } else if (state is UserErrorState) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else {
                return const Center(child: Text('No data found'));
              }
            },
          ),
        );
      }),
    );
  }
}
