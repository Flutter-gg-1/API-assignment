import 'package:api_lab/networking/network_api.dart';
import 'package:flutter/material.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkApi();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 166, 177, 183),
        appBar: AppBar(
            forceMaterialTransparency: true,
            titleTextStyle: const TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 49, 49, 49),
                fontWeight: FontWeight.bold),
            title: const Text("Photoes")),
        body: FutureBuilder(
          future: networkApi.getPhoto(),
          builder: (context, photo) {
            if (photo.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8, mainAxisSpacing: 8, crossAxisCount: 2),
                addSemanticIndexes: true,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Image.network(photo.data![index].url);
                });
          },
        ));
  }
}
