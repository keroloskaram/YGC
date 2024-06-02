
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Department extends StatefulWidget {
  static const String routeName = "department";
  final Map argments;

  const Department({super.key,required this.argments});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {

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
          .collection('colleges')
          .doc(widget.argments['collegeId'])
          .collection('department').get();
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
        title: Text("الأقسام"),
      ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'ابحث عن قسم',
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
        var department = data[index];

        final bool showItem =
            searchController.text.isEmpty ||
                department['name'].contains(
                  searchController.text.toLowerCase(),
                ) ||
                department['name'].contains(
                  searchController.text.toLowerCase(),
                );

        // Only show the item if it matches the search query
        if (!showItem) return Container();

        return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xff36265D),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              textColor: Colors.white,
              leading: Text("${index + 1}"),
              title: Text("${department['name']}"),
            ));
      },
    );
    return myList;
  }
}