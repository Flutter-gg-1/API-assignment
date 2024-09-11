import 'package:api_project/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
            vertical: MediaQuery.of(context).size.height * 0.06),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter user id',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) =>
                    bloc.add(ShowPostEvent(id: int.parse(value))),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is ShowPostSucessfullyState) {
                    return SingleChildScrollView(
                        child: Column(
                      children: state.posts
                          .map(
                            (e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(top: 30),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 179, 202, 219),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Column(
                                children: [
                                  Text(
                                    'Post : ${e.id}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${e.title}\n\n${e.body}\n',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                  Text(
                                    'by User : ${e.userId}\n',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ));
                  }
                  return Center(
                      heightFactor: 8,
                      child: Text(
                          controller.text.isNotEmpty
                              ? 'Post not found'
                              : 'Please fill the feild',
                          style: const TextStyle(fontSize: 20)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
