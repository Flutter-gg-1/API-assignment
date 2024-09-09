import 'package:api_assignment/api/networking_api.dart';
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
      body: Center(
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
    );
  }
}
