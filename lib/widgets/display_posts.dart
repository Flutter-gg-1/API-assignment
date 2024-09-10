import 'dart:math';
import 'package:api_assignment/blocs/post_bloc/post_bloc.dart';
import 'package:api_assignment/networking/api_networking.dart';
import 'package:api_assignment/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post.dart';

class DisplayPosts extends StatelessWidget {
  final Post post;
  const DisplayPosts({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<PostBloc>();
        final api = locator.get<ApiNetworking>();
        return BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is SuccessfullCommentState) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: state.comments.length,
                            itemBuilder: (context, index) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${state.comments[index].name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Comment: ${state.comments[index].body}'),
                                    const Divider()
                                  ]);
                            }),
                      ),
                    );
                  });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        transform: const GradientRotation(pi / 4),
                        colors: [
                          Colors.orange.shade100,
                          Colors.grey.withOpacity(0.1),
                          Colors.orange.shade100,
                        ])),
                child: FutureBuilder(
                    future: api.getAllComments(postId: post.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Title: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                      child: Text(
                                    post.title,
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic),
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Body: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                      child: Text(
                                    post.body,
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic),
                                  ))
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      bloc.add(DisplayComments(
                                          comments: snapshot.data ?? []));
                                    },
                                    child: const Text(
                                      'See all comments',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic),
                                    )),
                              )
                            ]);
                      }
                      return const Center(child: Text('No data is found'));
                    })),
          ),
        );
      }),
    );
  }
}
