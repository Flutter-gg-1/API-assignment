import 'package:api_assignment/extensions/screen_size.dart';
import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/ui_constants/app_colors.dart';
import 'package:api_assignment/widgets/other_details_widget.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserModel? user;
  final Function()? onPressed;
  const UserCard({super.key, this.user, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: secondaryColor,
              blurRadius: 3,
              offset: Offset(2, 2)
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: secondaryColor
        ),
        width: context.getWidth(),
        height: context.getHeight(divideBy: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user!.id.toString()} )',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user!.name,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),),
                OtherDetailsWidget(text: user!.email, icon: Icons.mail),
                OtherDetailsWidget(text: user!.phone, icon: Icons.call),
                OtherDetailsWidget(text: user!.address.city, icon: Icons.location_city),
              ],
            )
          ],
        )
      ),
    );
  }
}