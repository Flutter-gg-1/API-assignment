import 'package:api_assignment/bloc/user_bloc/user_bloc.dart';
import 'package:api_assignment/networking/api_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Builder(builder: (context) {
        // final api = ApiMixin();
        final bloc = BlocProvider.of<UserBloc>(context);
        bloc.add(ShowAllUsersEvent());
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 160, 138, 71),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return ListView(
                  children: List.generate(
                bloc.api.allUsers.length,
                (index) => Card(
                  child: ListTile(
                    title: Text(bloc.api.allUsers[index].name),
                    subtitle: const Text('This is page 1'),
                    leading: const Icon(Icons.verified_user),
                    trailing: const Icon(Icons.verified_user),
                  ),
                ),
              ));
            },
          ),
        );
      }),
    );
  }
}
