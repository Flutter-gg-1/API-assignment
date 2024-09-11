import 'package:api_assignment/Networking/networking.dart';
import 'package:api_assignment/views/images_view.dart';
import 'package:api_assignment/model/users_model.dart';
import 'package:api_assignment/views/posts_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final response = NetworkingApi();
    Future<List<UserModel>> userlist = response.getUsers();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Users Information",
          style: TextStyle(color: Colors.indigo),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagesView(),
                    ));
              },
              icon: const Icon(Icons.image, color: Colors.indigo))
        ],
      ),
      body: Center(
        child: SafeArea(
            child: ListView(
          children: [
            FutureBuilder(
                future: userlist,
                builder: (context, datauser) {
                  if (datauser.hasData) {
                    return Column(
                        children: List.generate(datauser.data!.length, (int i) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PostsView(userId: datauser.data![i].id)),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                datauser.data![i].name,
                                style: const TextStyle(color: Colors.indigo),
                              ),
                              subtitle: Text(
                                'username: ${datauser.data![i].username}\nemail: ${datauser.data![i].email}',
                                style: const TextStyle(
                                    color: Color.fromARGB(159, 63, 81, 181)),
                              ),
                            ),
                          ),
                        ),
                      );
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
