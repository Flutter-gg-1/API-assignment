import 'package:api_test/screens/posts/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key, this.userId});
  final int? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<PostBloc>();
        if (userId != null) {
          bloc.userId = userId;
        }
        bloc.add(PostLoadEvent());

        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('POSTS',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('User Id: ${bloc.userId}')
                    ],
                  ),
                  const Divider(),
                  BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      return (state is PostLoadEvent || bloc.posts.isEmpty)
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: ListView(
                                  children: bloc.posts
                                      .map((post) => InkWell(
                                            child: PostCard(post: post),
                                            onTap: () => (),
                                          ))
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
