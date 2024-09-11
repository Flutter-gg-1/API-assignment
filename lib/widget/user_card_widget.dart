import 'package:api_asg/networking/model/user_model.dart';
import 'package:api_asg/widget/user_data_widget.dart';
import 'package:flutter/material.dart';



class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key, required this.userModel,
  });


  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 10,
        child: Container(
          width: 250,
          height: 160, 
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(16),
          ),
          child:  Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserDataWidget( data: userModel.id.toString(),title: "id",),
               UserDataWidget( data: userModel.name,title: "name",),
               UserDataWidget( data: userModel.email,title: "email",),
               UserDataWidget( data: userModel.phone,title: "phone",),
              UserDataWidget( data: userModel.website,title: "website",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}