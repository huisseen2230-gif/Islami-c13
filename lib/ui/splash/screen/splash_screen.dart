
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/ui/home/screen/home_Screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash" ;
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:Image.asset(
            AssetsManager.splash,
            width: double.infinity,
            fit: BoxFit.fill,
        ) ,
      ),
    );
  }
}
