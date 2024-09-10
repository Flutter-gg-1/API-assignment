import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 138, 71),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Page 1'),
              subtitle: Text('This is page 1'),
              leading: Icon(Icons.verified_user),
              trailing: Icon(Icons.verified_user),
            ),
          ),
        ],
      ),
    );
  }
}
