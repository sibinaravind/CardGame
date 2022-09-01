import 'dart:async';

import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/home.dart';
import 'package:flutter/material.dart';
class LoginSplash extends StatefulWidget {
  const LoginSplash({Key? key,}) : super(key: key);
  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  
  
  @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 5),  
            ()=>Navigator.pop(context));
  }  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(   
      backgroundColor: Colors.transparent, 
      body: Center(
        child: Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/2,
              decoration:const  BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage('cards2.gif'),
                                fit: BoxFit.fill)
                          )
            ),
      ),
    );
  }
}
