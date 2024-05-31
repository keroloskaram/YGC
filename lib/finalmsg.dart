import 'package:flutter/material.dart';

class finalmsg extends StatelessWidget{
  static const String routeName = "finalmsg";
  finalmsg({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff36265D),
        title: Text("تواصل معنا ",style: TextStyle(color: Colors.white),),

      ),
      body: Center(
        child: Text("تم ارسال استفسارك بنجاح سيقوم احد بالرد ع استفسارك في اقرب وقت ",style: TextStyle(
          fontWeight: FontWeight.w900,fontSize: 30
        ),),
      ),
    );
  }
}