import 'package:api_assignment/api/networking_api.dart';
import 'package:api_assignment/pages/posts_page.dart';
import 'package:api_assignment/pages/users_page.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkingApi networkingApi = NetworkingApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: FutureBuilder(
                    future: networkingApi.getAllPhotos(),
                    builder: (context, data) {
                      if (data.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (data.hasData) {
                        return SingleChildScrollView(
                          child: Column(
                            children: data.data!.map((photo) {
                              return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.network(photo.thumbnailUrl));
                            }).toList(),
                          ),
                        );
                      }
                      return const Text("no data");
                    },
                  ),
                ),
              const SizedBox(height: 100,),
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
                                  builder: (context) => const PostsPage()));
                        },
                        child: const Text("Posts")),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UsersPage()));
                        },
                        child: const Text("Users")),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
