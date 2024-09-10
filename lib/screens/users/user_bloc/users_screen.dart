import 'package:api_test/screens/posts/post_bloc/posts_screen.dart';
import 'package:api_test/screens/users/user_bloc/user_bloc.dart';
import 'package:api_test/screens/users/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  void _navigateToPosts(BuildContext context, int userId) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PostsScreen(userId: userId)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(UserLoadEvent()),
      child: Builder(builder: (context) {
        final bloc = context.read<UserBloc>();
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('USERS',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return (state is UserLoadEvent || bloc.users.isEmpty)
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: ListView(
                                  children: bloc.users
                                      .map((user) => InkWell(
                                          child: UserCard(user: user),
                                          onTap: () => _navigateToPosts(
                                              context, user.id)))
                                      .toList()),
                            );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
