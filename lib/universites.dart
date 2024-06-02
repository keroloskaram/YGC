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
  var searchController = TextEditingController();

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
      appBar: AppBar(
        title: Text("الجامعات"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'ابحث عن جامعه',
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
        var university = data[index];

        final bool showItem =
            searchController.text.isEmpty ||
                university['name'].contains(
                  searchController.text.toLowerCase(),
                ) ||
                university['name'].contains(
                  searchController.text.toLowerCase(),
                );

        // Only show the item if it matches the search query
        if (!showItem) return Container();

        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            Faculty.routeName,
            arguments: university.reference.id,
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
                title: Text("${university['name']}"),
              )),
        );
      },
    );
    return myList;
  }
}
