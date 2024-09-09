import 'package:api_assignment/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9efec),
      appBar: AppBar(
        backgroundColor: const Color(0xff16423c),
        title: const Text("Users Data App"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Click on a user card to view their data", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0xff6a9c89), blurRadius: 3, offset: Offset(2, 2))],borderRadius: BorderRadius.circular(20), color: Color(0xff6a9c89)),
            width: context.getWidth(),
            height: context.getHeight(divideBy: 8),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name of user wow", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),),
                    Text("data", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                    Text("data", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                    Text("data", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                  ],
                )
              ],
            )
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
