import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train8/src/blocs/photos/photo_bloc.dart';

import '../models/photos/photos_model.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc()..add(getphotoEvent()),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: BlocBuilder<PhotoBloc, PhotoState>(
                    builder: (context, state) {
                      if (state is LoadphotoListState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else if (state is ErrorphotoListState) {
                        return Center(
                          child: Text(
                            state.msg,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        );
                      } else if (state is ShowphotosListState) {
                        final List<Photos> list1 = state.listphotos;
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            // Using FadeTransition for smooth fading effect
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: GridView.builder(
                            key: ValueKey<int>(
                                list1.length), // Unique key for the switcher
                            itemCount: list1.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    list1[index].thumbnailUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: Text(
                          "No Data Available",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
