import 'package:api_assignment/Networking/networking.dart';
import 'package:api_assignment/model/images_model.dart';
import 'package:flutter/material.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final response = NetworkingApi();
    Future<List<PhotosModel>> photosList = response.getPhotos();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Photos",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: Center(
        child: SafeArea(
            child: ListView(
          children: [
            FutureBuilder(
                future: photosList,
                builder: (context, photos) {
                  if (photos.hasData) {
                    return Column(
                        children: List.generate(10, (int i) {
                      return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 300,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.network(
                            photos.data![i].url,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Text('Somthing went wrong');
                            },
                          ));
                    }));
                  }
                  return const Center(child: CircularProgressIndicator());
                })
          ],
        )),
      ),
    );
  }
}
