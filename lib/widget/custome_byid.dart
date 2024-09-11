import 'package:api_flutter/networking/network_api.dart';
import 'package:flutter/material.dart';

class CustomePostById extends StatelessWidget {
  const CustomePostById({
    super.key,
    required this.index,
    required this.api,
  });

  final int index;
  final NetworkingApi api;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.getPosts(),
        builder: (context, dataForm) {
          if (dataForm.hasData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.84,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black12),
                    child: ListTile(
                      title: Text(dataForm.data![index].title),
                      subtitle: Text(dataForm.data![index].body),
                      leading: Text(
                          'userID: ${dataForm.data![index].userId.toString()}'),
                      trailing: Text(
                          'idPost: ${dataForm.data![index].id.toString()}'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
