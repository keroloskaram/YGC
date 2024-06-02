import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradprojec/departments.dart';

class Faculty extends StatefulWidget {
  static const String routeName = "faculty";
  final Map argments;

  const Faculty({super.key, required this.argments});

  @override
  State<Faculty> createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {

  bool isLoading = true;
  bool hasError = false;
  List<QueryDocumentSnapshot> data = [];
  var searchController = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('university')
          .doc(widget.argments['universityId'])
          .collection('colleges').get();
      data = querySnapshot.docs;
      setState(() => isLoading = false);
    } catch (e) {
      setState(() => hasError = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الكليات"),
      ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'ابحث عن كليه',
                ),
                onChanged: (result){
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 20),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : hasError
                  ? const Center(child: Text("حدث خطأ"))
                  : data.isEmpty
                  ? const Text("لا يوجد")
                  : getList(),
            ],
          ),
        )
    );
  }
  Widget getList() {
    ListView myList = ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: data.length,
      itemBuilder: (context, index) {
        var faculty = data[index];

        final bool showItem =
            searchController.text.isEmpty ||
                faculty['name'].contains(
                  searchController.text.toLowerCase(),
                ) ||
                faculty['name'].contains(
                  searchController.text.toLowerCase(),
                );

        // Only show the item if it matches the search query
        if (!showItem) return Container();

        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            Department.routeName,
            arguments: {
              'universityId':widget.argments['universityId'],
              'collegeId':faculty.reference.id,
            },
          ),
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xff36265D),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                textColor: Colors.white,
                leading: Text("${index + 1}"),
                title: Text("${faculty['name']}"),
              )),
        );
      },
    );
    return myList;
  }
}