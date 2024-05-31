import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradprojec/enterresult.dart';
import 'package:gradprojec/universites.dart';

import 'contact-us.dart';

class home extends StatelessWidget {
  static const String routeName = "home";
  home({super.key});

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
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff36265D),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff36265D),
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          width: 320,
                          height: 94,
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, University.routeName);
                                  },
                                  child: Text(
                                    "قائمه الجامعات",
                                    style: TextStyle(color: Color(0xffF6CD2E), fontSize: 30),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff36265D),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff36265D),
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          width: 320,
                          height: 94,
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, result.routeName);
                                  },
                                  child: Text(
                                    "ادخل المجموع",
                                    style: TextStyle(color: Color(0xffF6CD2E), fontSize: 30),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff36265D),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff36265D),
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          width: 320,
                          height: 94,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, ContactUs.routeName);
                            },
                            child: Center(
                                child: Text(
                              "تواصل معنا ",
                              style: TextStyle(color: Color(0xffF6CD2E), fontSize: 30),
                            )),
                          ),
                        ),
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
