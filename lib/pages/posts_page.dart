import 'package:api_assignment/api/networking_api.dart';
import 'package:api_assignment/models/post/post_model.dart';
import 'package:api_assignment/pages/photos_page.dart';
import 'package:api_assignment/pages/users_page.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkingApi networkApi = NetworkingApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                FutureBuilder<List<PostModel>>(
                  future: networkApi.getUserPosts(),
                  builder: (context, AsyncSnapshot<List<PostModel>> data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (data.hasData && data.data!.isNotEmpty) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: data.data!.map(
                            (e) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 45,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 151, 209, 238),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(e.title),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      );
                    } else {
                      return const Text("No data available");
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UsersPage()));
                          },
                          child: const Text("Users")),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PhotosPage()));
                          },
                          child: const Text("Photos")),
                    ],
                  ))),
        ],
      ),
    );
  }
}
