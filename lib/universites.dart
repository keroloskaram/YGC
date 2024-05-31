import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'facuilites.dart';

class University extends StatefulWidget {
  static const String routeName = "university";

  const University({super.key});

  @override
  State<University> createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  bool isLoading = true;
  bool hasError = false;
  List<QueryDocumentSnapshot> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("university").get();
      data = querySnapshot.docs;
      setState(() => isLoading = false);
    } catch (e) {
      setState(() => hasError = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/university.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 150,
                    right: 20,
                    child: Text(
                      "قائمة الجامعات",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 30,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Icon(Icons.arrow_back)
                ],
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              height: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : hasError
                      ? const Center(
                          child: Text("Something went errorrrrrrrrr"))
                      : data.isEmpty
                          ? const Text("List is empty")
                          : getList(),
            ),
          )
        ],
      ),
    );
  }

  Widget getList() {
    ListView myList = ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: data.length,
      itemBuilder: (context, index) {
        var university = data[index];

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Faculty.routeName,
                arguments: university.reference.id),
            child: Container(
              width: 265,
              height: 95,
              decoration: BoxDecoration(
                color: const Color(0xff36265D),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text(
                  "${data[index]['name']}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    return myList;
  }
}
