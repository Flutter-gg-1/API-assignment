import 'package:flutter/material.dart';

import '../networking/networking_api.dart';

class PostsSreen extends StatelessWidget {
  const PostsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = NetworkingApi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 30, 63),
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: api.getAllposts(),
          builder: (context, dataFromMethod) {
            if (dataFromMethod.hasData) {
              return ListView(
                  children: dataFromMethod.data!
                      .map((e) => Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(10),
                                width: 400,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        133, 182, 127, 158),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 4,
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(0, 0))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "User ID: ${e.userId}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "ID: ${e.id}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Title: ${e.title}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Body: ${e.body}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ))
                      .toList());
            }
            if (dataFromMethod.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return const Text("error");
          }),
    );
  }
}
