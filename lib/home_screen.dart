import 'package:api_assignment/networking/networking_api.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final api = NetworkingApi();
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 30, 63),
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: CrystalNavigationBar(
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          currentIndex: selectIndex,
          onTap: (p0) {
            selectIndex = p0;
            setState(() {});
          },
          items: [
            CrystalNavigationBarItem(icon: Icons.person),
            CrystalNavigationBarItem(icon: Icons.photo_rounded),
            CrystalNavigationBarItem(icon: Icons.post_add_rounded),
          ]),
      body: FutureBuilder(
          future: api.getAllUsers(),
          builder: (context, dataFromMethod) {
            if (dataFromMethod.hasData) {
              return ListView(
                  children: dataFromMethod.data!
                      .map((e) => Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(10),
                                width: 400,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        133, 182, 127, 158),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 4,
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(0, 0))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name: ${e.name}"),
                                    Text("UserName: ${e.username}"),
                                    Text("Email: ${e.email}"),
                                    Text("Phone: ${e.phone}"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ))
                      .toList());
            }
            if (dataFromMethod.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return const Text("error");
          }),
    );
  }
}
