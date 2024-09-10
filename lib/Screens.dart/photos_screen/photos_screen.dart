import 'package:api_assignment/Screens.dart/photos_screen/photos_bloc/photos_bloc.dart';
import 'package:api_assignment/models/photo_model/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<PhotosBloc>();
        bloc.add(GetPhotosEvent());
        return Scaffold(
          
          body: Center(child: SingleChildScrollView(
              child: BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              if (state is LoadPhotosState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is SuccessPhotosState) {
                List<PhotoModel> list = state.photos;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: List.generate(10, (int index) {
                      final photo = list[index];
                      return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(photo.url), 
                    );
                    }),
                  ),
                );
              }
              if (state is ErrorPhotosState) {
                return Text(state.msg);
              }
              return const Text("No Data");
            },
          ))),
        );
      }),
    );
  }
}