import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class result extends StatelessWidget{
  static const String routeName="result";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff36265D) ,
        ),
        body: Column(
          children: [



            Expanded(
              flex: 1,
              child: Container(
                      width: double.infinity,

                      color: Color(0xff36265D),

                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                    Center(child: Text("ادخل مجموعك",style: TextStyle(color:Colors.white,fontSize: 30),)),
                        SizedBox(height: 20,),


                        Container(
                          color: Color(0xff42305A),
                            margin: EdgeInsets.only(left:60,right: 60),
                            child: TextField(


                            )),
SizedBox(height: 40,),

ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xffF6CD2E
    )),
    onPressed: (){}, child: Text("اضغط هنا",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))

                      ],
                    ),
                    ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}