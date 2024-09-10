import 'package:api_assignment/Screens.dart/Users_screen/users_bloc/users_block_bloc.dart';
import 'package:api_assignment/models/users_model/user_model.dart';
import 'package:api_assignment/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});
  void showUserDetels(context, UserModel user) {
    showBottomSheet(
        context: context, builder: (context) => UserDataWidget(user: user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBlockBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<UsersBlockBloc>();
        bloc.add(GetUserEvent());
        return Scaffold(
          
          body: Center(child: SingleChildScrollView(
              child: BlocBuilder<UsersBlockBloc, UsersBlockState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is SuccessState) {
                List<UserModel> list = state.users;
                return Column(
                  children: List.generate(list.length, (int index) {
                    return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        color: const Color.fromARGB(255, 247, 180, 104),
                        child: ListTile(
                          title: Text(state.users[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID: ${state.users[index].id}"),
                              Text("UserName: ${state.users[index].username}"),
                            ],
                          ),
                          onTap: () =>
                              showUserDetels(context, state.users[index]),
                        ));
                  }),
                );
              }
              if (state is ErrorState) {
                return Text(state.msg);
              }
              return const Text("No Data");
            },
          ))),
        );
      }),
    );
  }
}
