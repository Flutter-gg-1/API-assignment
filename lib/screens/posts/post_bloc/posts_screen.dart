import 'package:api_test/screens/posts/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_alert_dialog.dart';
import '../post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key, this.userId});
  final int? userId;

  void _showAlert({
    required BuildContext context,
    required String msg,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(content: msg);
      },
    );
  }

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

        return BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if ((state is PostErrorState)) {
              _showAlert(context: context, msg: state.msg);
            }
          },
          child: Scaffold(
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
          ),
        );
      }),
    );
  }
}
