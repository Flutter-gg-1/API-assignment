import 'package:api/network/network_api.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreen();
}

class _AlbumScreen extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: NetworkApi().getAlbum(),
              builder: (context, requred) {
                if (requred.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (requred.hasData) {
                  final albums = requred.data;
                  return ListView.builder(
                      itemCount: albums?.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            children: [
                              Text("Title:${albums![index].title}"),
                              Image.network(albums[index].thumbnailUrl),
                              Image.network(albums[index].url),
                            ],
                          ),
                        );
                      });
                }
                return const Text("error");
              })),
    );
  }
}
