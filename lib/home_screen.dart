import 'package:api_flutter/networking/network_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final h = NetworkingApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: h.allUsers(),
                builder: (context, dataForm) {
                  if (dataForm.hasData) {
                    return Text('data');
                  }
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
