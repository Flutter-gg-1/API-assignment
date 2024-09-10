import 'package:api_app/blocs/photo_bloc/photo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<PhotoBloc>();
        bloc.add(LoadPhotoEvent());
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "10 Photos",
                  style: TextStyle(color: Colors.blue, fontSize: 40),
                ),
                SizedBox(
                  height: 200,
                  child: BlocBuilder<PhotoBloc, PhotoState>(
                    builder: (context, state) {
                      if (state is ErrorState) {
                        return Text("Something Error");
                      }
                      if (state is LoadPhotoState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is SuccessPhotoState) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 400,
                                width: 300,
                                child: Center(
                                  child: CachedNetworkImage(
                                    imageUrl: state.listPhoto[index].url,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              );
                            });
                      }
                      return Text("No data fetched!");
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
