import 'package:class_11/models/users_model.dart';
import 'package:class_11/networking/api_network.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final x = ApiNetwork();
    var user = x.getAllUsers();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: user,
              builder: (context, AsyncSnapshot<List<UsersModel>> dataFromApi) {
                if (dataFromApi.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(color: Colors.red);
                }
                return Column(
                    children: dataFromApi.data!
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.yellowAccent, width: 5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                            "${e.id} \n${e.name} \n${e.email} \n${e.address!.street} \n${e.address!.suite} \n${e.address!.city} \n${e.address!.zipcode} \n${e.address!.geo!.lat} \n${e.address!.geo!.lng} \n${e.phone} \n${e.website} \n${e.company!.name} \n${e.company!.catchPhrase} \n${e.company!.bs}")
                                      ],
                                    ),
                                  )),
                            ))
                        .toList());
              }),
        ),
      ),
    ));
  }
}
