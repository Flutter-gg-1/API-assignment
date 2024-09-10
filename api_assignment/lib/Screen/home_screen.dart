import 'package:api_assignment/model/user_model.dart';
import 'package:api_assignment/networking/api_mixin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Home Screen"),
              ElevatedButton(
                  onPressed: () async {
                    print("object");
                    List<UserModel> users = await ApiMixin().displayAllUsers();
                    for (var e in users) {
                      print(e.name);
                    }
                    // print(ApiMixin().display10OnlyOfPhotos());
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
