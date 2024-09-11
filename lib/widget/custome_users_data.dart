import 'package:api_flutter/networking/network_api.dart';
import 'package:flutter/material.dart';

class CustomeUsers extends StatelessWidget {
  const CustomeUsers({
    super.key,
    required this.api,
    this.index,
  });

  final NetworkingApi api;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.allUsers(),
        builder: (context, dataForm) {
          if (dataForm.connectionState == ConnectionState.waiting ||
              dataForm.data == null) {
            CircularProgressIndicator;
          }
          if (dataForm.hasData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.84,
              child: ListView.builder(
                itemCount: dataForm.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black12),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('name ${dataForm.data![index].name}'),
                              subtitle:
                                  Text('email: ${dataForm.data![index].email}'),
                              leading: Text(
                                  'website: ${dataForm.data![index].website}'),
                              trailing:
                                  Text(dataForm.data![index].id.toString()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    'username: ${dataForm.data![index].username}'),
                                Text('phone: ${dataForm.data![index].phone}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    'city: ${dataForm.data![index].address.city}'),
                                Text(
                                    'street: ${dataForm.data![index].address.street}'),
                                Text(
                                    'suite: ${dataForm.data![index].address.suite}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'zipCode: ${dataForm.data![index].address.zipcode}',
                                ),
                                Text(
                                  'Lat: ${dataForm.data![index].address.geo.lat}',
                                ),
                                Text(
                                  'Lng: ${dataForm.data![index].address.geo.lng}',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      )
                    ],
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
