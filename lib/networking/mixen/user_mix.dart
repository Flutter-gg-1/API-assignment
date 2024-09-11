




import 'dart:convert';

import 'package:api_asg/networking/const_url.dart';
import 'package:api_asg/networking/model/user_model.dart';
import 'package:http/http.dart' as http;

mixin UserMix on ConstUrl {




  Future<List<UserModel>>  getAllUser({ String userId = ""}) async{


    


    final List<UserModel> userLis = [];


    String callUrl = "";
    


    if(userId != "" ){

      callUrl = "$domin$userEnd?id=$userId";

  
    }else{
       callUrl = "$domin$userEnd";
    }

    final res =  await http.get(Uri.parse(callUrl));


    for(var val in jsonDecode(res.body)){


      userLis.add(UserModel.fromJson(val));


    }



    return  userLis;





  }
}