import 'package:api_assignment/bloc/users_bloc.dart';
import 'package:api_assignment/bottom_nav_screen.dart';
import 'package:api_assignment/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                context.read<UsersBloc>().add(GetUserEvent());
              },
              child: Text("press me")),
          Container(
            color: Colors.pink,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ShowUserState) {
                  final List<UserModel> list = state.listUser;
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(list.length, (int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                          child: Row(
                            children: [Text(state.listUser[index].name)],
                          ),
                        );
                      }));
                }
                if (state is ErrorState) {
                  return Center(
                    child: Text(state.msg),
                  );
                }
                return Text("data");
              },
            ),
          )
        ],
      ),
    );
  }
}
