import 'package:flutter/material.dart';
import 'package:phoneappas1/firebase_services/splash_services.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  Splashservices splashscreen = Splashservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('WELCOME', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
