// import 'package:api_assignment/bloc/users_bloc.dart';
// import 'package:api_assignment/models/photo_model.dart';
// import 'package:api_assignment/models/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PhotoView extends StatelessWidget {
//   const PhotoView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () async {
//                 context.read<UsersBloc>().add(GetUserEvent());
//               },
//               child: Text("press me")),
//           Container(
//             color: Colors.pink,
//             child: BlocBuilder<UsersBloc, UsersState>(
//               builder: (context, state) {
//                 if (state is LoadingState) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 if (state is ShowUserState) {
//                   final List<PhotoModel> list =state.listUser;
//                   return Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: List.generate(list.length, (int index) {
//                         return Padding(
//                           padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: NetworkImage(state.listUser[index].),
//                               )
//                               ,Text(state.listUser[index].name)],
//                           ),
//                         );
//                       }));
//                 }
//                 if (state is ErrorState) {
//                   return Center(
//                     child: Text(state.msg),
//                   );
//                 }
//                 return Text("data");
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:api_assignment/bloc/users_bloc.dart';
import 'package:api_assignment/models/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // Trigger the GetPhotoEvent to load the photos
              context.read<UsersBloc>().add(GetPhotoEvent());
            },
            child: Text("Load Photos"),
          ),
          Expanded(
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ShowPhotoState) {
                  final List<PhotoModel> photoList = state.listPhoto;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Change to 2 for 2 images per row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: photoList.length,
                    itemBuilder: (context, index) {
                      final photo = photoList[index];
                      return Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                photo
                                    .thumbnailUrl, // Or use 'url' for full-size image
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              photo.title,
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                if (state is ErrorState) {
                  return Center(
                    child: Text(state.msg),
                  );
                }

                return Center(
                  child: Text("Press the button to load photos."),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
