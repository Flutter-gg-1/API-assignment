import 'package:apiasswignment/bloc/post_bloc.dart';
import 'package:apiasswignment/network/api_post_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  final futureApi = ApiPostNetworking();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(futureApi)..add(GetPostsData()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Posts list (userId = 1)'),
          ),
          body: BlocBuilder<PostsBloc, PostState>(
            builder: (context, state) {
              if (state is PostLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PostloadedState) {
                final posts = state.posts;

                // Filter posts by userId == 1
                final filteredPosts =
                    posts.where((post) => post.userId == 1).toList();

                if (filteredPosts.isNotEmpty) {
                  return ListView.separated(
                    itemCount: filteredPosts.length,
                    itemBuilder: (context, index) {
                      final post = filteredPosts[index];
                      return ListTile(
                        title: Text("${post.title}"),
                        subtitle: Text(post.body),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text("No posts found with userId = 1"));
                }
              } else if (state is PostErrorState) {
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
