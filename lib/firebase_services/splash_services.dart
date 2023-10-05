import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phoneappas1/UI/auth/login_screen.dart';


class Splashservices{


  void isLogin(BuildContext context){

    Timer(const Duration(seconds: 3),
        () => Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen())));
  }
}