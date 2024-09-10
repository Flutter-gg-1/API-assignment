import 'package:api_assignment/bloc/users_bloc.dart';
import 'package:api_assignment/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneUserView extends StatelessWidget {
  const OneUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts by User 1"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Trigger the GetPostsEvent to load posts
              context.read<UsersBloc>().add(GetPostsEvent());
            },
            child: Text("Load Posts"),
          ),
          Expanded(
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ShowPostState) {
                  final List<PostModel> postsList = state.postList;

                  return ListView.builder(
                    itemCount: postsList.length,
                    itemBuilder: (context, index) {
                      final post = postsList[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  );
                }

                if (state is ErrorState) {
                  return Center(
                    child: Text(state.msg),
                  );
                }

                return Center(
                  child: Text("Press the button to load posts."),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
