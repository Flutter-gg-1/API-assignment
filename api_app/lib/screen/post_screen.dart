import 'package:api_app/blocs/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<PostBloc>();
        bloc.add(LoadPostEvent());
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const Text(
                  "Post User ID 1",
                  style: TextStyle(color: Colors.blue, fontSize: 40),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      if (state is ErrorState) {
                        return Text("Something Error");
                      }
                      if (state is LoadPostState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is SuccessPostState) {
                        return ListView.builder(
                          itemCount: state.listPosts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 300,
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ID:${state.listPosts[index].id}"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "title : ${state.listPosts[index].title}"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Body:${state.listPosts[index].body}")
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Text("No data fetched!");
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
