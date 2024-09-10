import 'package:api_project/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    bloc.add(ShowUserEvent());
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          if (state is ShowUserSucessfullyState) {
            return SingleChildScrollView(
              child: Column(
                children: state.users
                    .map(
                      (e) => Column(
                        children: [
                          ListTile(
                            title: Text(e.name),
                            subtitle: Text(e.email),
                            leading: Text(e.id.toString()),
                            trailing: Text(e.company.name),
                          ),
                          const Divider()
                        ],
                      ),
                    )
                    .toList(),
              ),
            );
          }
          return const Center(
              child: Text(
            'There is no user :(',
            style: TextStyle(fontSize: 20),
          ));
        },
      ),
    );
  }
}
