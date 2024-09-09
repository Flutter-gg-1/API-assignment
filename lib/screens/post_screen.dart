import 'package:api_lab/networking/network_api.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final String name;
  final int userId;
  const PostScreen({super.key, required this.name, required this.userId});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkApi();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 202, 206),
      appBar: AppBar(
          forceMaterialTransparency: true,
          titleTextStyle: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 49, 49, 49),
              fontWeight: FontWeight.bold),
          title: Text(name)),
      body: FutureBuilder(
          future: networkApi.getPhotoById(userId: userId),
          builder: (context, post) {
            if (post.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: kElevationToShadow[2],
                    ),
                    child: ListTile(
                      title: Text(post.data![index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(post.data![index].body),
                    ),
                  );
                },
                itemCount: post.data!.length);
          }),
    );
  }
}
