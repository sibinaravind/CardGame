import 'dart:async';

import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class LoginSplash extends StatefulWidget {
  const LoginSplash({Key? key,}) : super(key: key);
  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  
  
  @override  
  void initState()  {  
    super.initState();  
    Timer(Duration(seconds: 3),  
            ()=>
           {
            Get.back(),
            Get.to(HomePage())
   } );
  }  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(   
      backgroundColor: AppColors.maincolor, 
      body: Center(
        child: Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/2,
              decoration:const  BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage('assets/cards2.gif'),
                                fit: BoxFit.fill)
                          )
            ),
      ),
    );
  }
}
