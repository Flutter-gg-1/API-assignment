import 'package:api_assignment/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xff6a9c89),
              blurRadius: 3,
              offset: Offset(2, 2)
            )
          ],
          borderRadius: BorderRadius.circular(20), color: const Color(0xff6a9c89)
        ),
        width: context.getWidth(),
        height: context.getHeight(divideBy: 8),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name of user wow",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),),
                Text("data",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                Text("data",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                Text("data",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
              ],
            )
          ],
        )
      ),
    );
  }
}