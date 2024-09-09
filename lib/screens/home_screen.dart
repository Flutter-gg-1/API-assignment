import 'package:api_assignment/extensions/screen_navigation.dart';
import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/screens/user_data_screen.dart';
import 'package:api_assignment/services/api_networking.dart';
import 'package:api_assignment/ui_constants/app_colors.dart';
import 'package:api_assignment/widgets/loading_indicator_widget.dart';
import 'package:api_assignment/widgets/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiNetworking();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Users Data App"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: api.getAllUsers(),
          builder: (context, response) {
            if(response.connectionState == ConnectionState.done) {
              if(response.hasData) {
                List<UserModel>? users = response.data;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Text("Click on a user card to view their data", style: TextStyle(fontSize: 18, color: mainColor)),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                      itemCount: users?.length,
                      itemBuilder: (context, index) => UserCard(user : users?[index], onPressed: ()=> context.push(to: UserDataScreen(user: users?[index])))
                      ),
                    ),
                  ],
                );
              }
              else {
                Center(child: Text("No Users Found", style: TextStyle(color: mainColor)));
              }
            }
            return const LoadingIndicatorWidget(text: "Loading Users ....",);
          }
        )
      ),
    );
  }
}
