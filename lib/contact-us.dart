import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradprojec/finalmsg.dart';

import 'custom_text_field.dart';

class ContactUs extends StatefulWidget {
  static const String routeName = "contactUs";

  ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "تواصل معانا",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: nameController,
                title: "الأسم",
                hint: "من فضلك ادخل اسمك",
                validator: (String? v) {
                  if (v.toString().isEmpty) {
                    return 'مطلوب';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: emailController,
                title: "البريد الالكتروني",
                hint: "من فضلك ادخل البريد الالكتروني الخاص بك",
                validator: (String? v) {
                  if (v.toString().isEmpty) {
                    return 'مطلوب';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: contentController,
                title: "الاستفسار",
                hint: "من فضلك وضح لنا استفسارك",
                maxLines: 5,
                validator: (String? v) {
                  if (v.toString().isEmpty) {
                    return 'مطلوب';
                  }
                  return null;
                },
              ),

              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF6CD2E),
                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(5)
                      )
                    ),
                    onPressed: () {
                      saveContactUs();
                    },
                    child: const Text("ارسال")),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void saveContactUs() async {
    CollectionReference collection =
    FirebaseFirestore.instance.collection('ContactUs');

    Map<String, dynamic> data = {
      'name':nameController.text,
      'email':emailController.text,
      'content':contentController.text,
    };

    try {
      DocumentReference docRef = await collection.add(data);
      print('Document added with ID: ${docRef.id}');
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "تم ارسال استفسارك بنجاح سيقوم احد بالرد ع استفسارك في اقرب وقت ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0,
      );


    } catch (e) {
      print('Error adding document: $e');
    }
  }
}
