import 'package:api_assignment/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class DisplayUserDetails extends StatelessWidget {
  final String label;
  final String details;
  final bool isId;
  const DisplayUserDetails(
      {super.key,
      required this.label,
      required this.details,
      this.isId = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Flexible(
            child: Text(
          details,
          style: const TextStyle(fontStyle: FontStyle.italic),
        )),
        if (isId)
          const Spacer(
            flex: 10,
          ),
        if (isId)
          Container(
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment(0.8, 0.0),
                  colors: [Colors.blue, Colors.indigo, Colors.indigo],
                  tileMode: TileMode.repeated,
                )),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostsScreen(
                                userId: int.parse(details),
                              )));
                },
                child: const Text(
                  'Posts',
                  style: TextStyle(color: Colors.white),
                )),
          )
      ],
    );
  }
}
