import 'package:api_assignment/Screens.dart/posts_screen/user_post_bloc/userposts_bloc.dart';
import 'package:api_assignment/models/post_model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPostsBloc()..add(GetUserPostsEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(child: SingleChildScrollView(
              child: BlocBuilder<UserPostsBloc, UserPostsState>(
            builder: (context, state) {
              if (state is LoadPostsState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is SuccessPostsState) {
                List<PostModel> list = state.posts;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: List.generate(list.length, (int index) {
                      final post = list[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        color: const Color.fromARGB(255, 247, 180, 104),
                        child: ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                        ),
                      );
                    }),
                  ),
                );
              }
              if (state is ErrorPostsState) {
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
