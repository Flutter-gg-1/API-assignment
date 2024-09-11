import 'package:api_flutter/networking/network_api.dart';
import 'package:flutter/material.dart';

class CustomePhotos extends StatelessWidget {
  const CustomePhotos({
    super.key,
    required this.api,
  });

  final NetworkingApi api;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.photos(),
        builder: (context, dataForm) {
          if (dataForm.hasData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.84,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black12),
                          child: Center(
                            child: Image.network(
                                dataForm.data![index].thumbnailUrl),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      )
                    ],
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
