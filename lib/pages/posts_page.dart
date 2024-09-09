import 'package:api_assignment/api/networking_api.dart';
import 'package:api_assignment/models/user/user_model.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkingApi networkApi = NetworkingApi();
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<UserModel>>(
          future: networkApi.getAllUsers(),
          builder: (context, AsyncSnapshot<List<UserModel>> data) {
            if (data.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (data.hasData && data.data!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: data.data!.map(
                    (e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 151, 209, 238),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(e.name),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              );
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}
