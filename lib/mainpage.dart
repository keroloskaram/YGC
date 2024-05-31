import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradprojec/home.dart';
import 'extension.dart';

class mainpage extends StatelessWidget {
  static const String routeName = "main";

  mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      backgroundColor: Color(0xff36265D),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Image.asset("assets/images/main2.png"),
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff36265D),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "أكتشف جامعتك الان",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF6CD2E),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, home.routeName);
                              },
                              child: Text(
                                "انضم الينا الان",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff36265D)),
                              )),
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
