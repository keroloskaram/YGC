
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradprojec/mainpage.dart';
import 'package:gradprojec/home.dart';
import 'package:gradprojec/universites.dart';

class splashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
    ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => mainpage())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Image.asset("assets/images/main.png")
    );
  }
}