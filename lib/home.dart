import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradprojec/enterresult.dart';
import 'package:gradprojec/universites.dart';

import 'contact-us.dart';

class Home extends StatelessWidget {
  static const String routeName = "home";
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Color(0xff36265D),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "الصفحه الرئيسيه",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Image.asset("assets/images/sall.png")
                  ],
                ),
              ),
            ),



            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         InkWell(
                           onTap: (){
                             Navigator.pushNamed(context, University.routeName);
                           },
                           child: Card(
                             elevation: 10,
                             child:  Padding(
                               padding: EdgeInsets.all(10),
                               child: Column(
                                 children: [
                                   Image.asset("assets/icons/university_icon.png",height: 100,),
                                   SizedBox(height: 10),
                                   Text("الجامعات")
                                 ],
                               ),
                             ),
                           ),
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.pushNamed(context, Result.routeName);
                           },
                           child:   Card(
                           elevation: 10,
                           child:  Padding(
                             padding: EdgeInsets.all(10),
                             child: Column(
                               children: [
                                 Image.asset("assets/icons/total_icon.png",height: 100,),
                                 SizedBox(height: 10),
                                 Text("المجموع")
                               ],
                             ),
                           ),
                         ),),
                       ],
                     ),
                      SizedBox(height: 50),
                      Center(
                        child:   InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, ContactUs.routeName);
                          },
                          child:  Card(
                          elevation: 10,
                          child:  Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset("assets/icons/contact_us_icon.png",height: 100,),
                                SizedBox(height: 10),
                                Text("أتصل بنا")
                              ],
                            ),
                          ),
                        ),),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
