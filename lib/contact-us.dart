import 'package:flutter/material.dart';
import 'package:gradprojec/contact-model.dart';
import 'package:gradprojec/finalmsg.dart';
import 'firebase_functions.dart';

class ContactUs extends StatefulWidget {
  static const String routeName = "contactUs";

  ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff36265D),
        title: Text(
          "تواصل معانا",
          style: TextStyle(fontSize: 30,color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "الأسم ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "من فضلك دخل اسمك",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: _name,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "البريد الالكتروني الخاص بك",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "من فضلك دخل بريدك الالكتروني",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: _email,
                )),
            SizedBox(
              height: 20,
            ),
            const Text(
              "ارسل لنا استفسارك ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                child: TextFormField(
              decoration: InputDecoration(
                  hintText: "من فضلك  ارسل الاستفسار",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: _phonenumber,
            )),
            SizedBox(
              height: 20,
            ),

            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF6CD2E),
                  ),
                  onPressed: () {
                    try {
                      // int phone = int.parse(_phonenumber.text);
                      // ContactModel contact = ContactModel(
                      //     name: _name.text, email: _email.text, phonenumber: phone);
                      // firebaseFunctions.addcontact(contact);

                      Navigator.pushNamed(context, finalmsg.routeName);
                    } catch (e) {
                      print(Text("Error :$e"));
                    }
                  },
                  child: const Text("ارسال")),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, AllPersonScreen.routeName);
            //     },
            //     child: const Text("get persons")),
            // ElevatedButton(onPressed: (){
            //   Navigator.pushNamed(context, SearchScreen.routeName);
            // }, child: Text("Search for a person"))
          ],
        ),
      ),
    );
  }
}
