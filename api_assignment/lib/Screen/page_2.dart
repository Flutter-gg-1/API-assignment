import 'package:api_assignment/bloc/phto_bloc/Photos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosBloc(),
      child: Builder(builder: (context) {
        final bloc = BlocProvider.of<PhotosBloc>(context);
        bloc.add(ShowPhotosEvent());
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 160, 138, 71),
          body: Container(),
        );
      }),
    );
  }
}
