
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class department extends StatelessWidget {
  static const String routeName = "department";
  final String collegeId;
  final String universityId;


  const department({super.key, required this.collegeId,required this.universityId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الأقسام"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('university')
            .doc("A94c2ryJS6xnSqdfIc9X")
            .collection('colleges')
            .doc("5yVwTKb3hcxQHid7pvqv")
            .collection('department')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());

          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text("لا توجد اقسام"));
          }

          var faculties = snapshot.data!.docs;

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemCount: faculties.length,
            itemBuilder: (context, index) {
              var university = faculties[index];

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap:() {
                    Navigator.pushNamed(context, department.routeName,
                        arguments: "collegeId");

                  },
                      // Navigator.pushNamed(context, Faculty.routeName,
                      // arguments: university.reference.id
                      //
                      // ),,
                  child: Container(
                    width: 265,
                    height: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff36265D),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Center(
                      child: Text(
                        "${faculties[index]['name']}",
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



          //   ListView.builder(
          //   itemCount: faculties.length,
          //   itemBuilder: (context, index) {
          //     var faculty = faculties[index];
          //     return ListTile(
          //       title: Text(faculty['name']),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Faculty extends StatefulWidget {
//   static const String routeName = "faculty";
//
//   const Faculty({super.key});
//
//   @override
//   State<Faculty> createState() => _FacultyState();
// }
//
// class _FacultyState extends State<Faculty> {
//   List<QueryDocumentSnapshot> facdata = [];
//   bool isLoading = false;
//   bool hasError = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   Future<void> getData() async {
//     final String universityId =
//         ModalRoute.of(context)!.settings.arguments as String;
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('university')
//           .doc(universityId)
//           .collection('colleges')
//           .get();
//       setState(() {
//         facdata = querySnapshot.docs;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         hasError = true;
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final String universityId =
//         ModalRoute.of(context)!.settings.arguments as String;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     "assets/images/university.png",
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   const Positioned(
//                     bottom: 150,
//                     right: 20,
//                     child: Text(
//                       "قائمة الكليات",
//                       style: TextStyle(fontSize: 28, color: Colors.white),
//                     ),
//                   ),
//                   Positioned(
//                     left: 10,
//                     top: 30,
//                     child: InkWell(
//                       onTap: () => Navigator.pop(context),
//                       child: const Icon(
//                         Icons.arrow_back,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Positioned.fill(
//             child: Container(
//               height: 650,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.white,
//               ),
//               child: isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : hasError
//                       ? const Center(child: Text("Something went wrong"))
//                       : facdata.isEmpty
//                           ? const Center(child: Text("List is empty"))
//                           : ListView.builder(
//                               itemCount: facdata.length,
//                               itemBuilder: (context, index) {
//                                 var college = facdata[index];
//                                 return ListTile(
//                                   title: Text(college['name']),
//                                   onTap: () {
//                                     Navigator.pushNamed(
//                                       context,
//                                       'departments', // Assuming you have a Departments route
//                                       arguments: {
//                                         'collegeId': college.id,
//                                         'universityId': universityId,
//                                       },
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gradprojec/departments.dart';
//
// class Faculty extends StatefulWidget {
//   static const String routeName = "faculty";
//
//   const Faculty({super.key});
//
//   @override
//   State<Faculty> createState() => _FacultyState();
// }
//
// class _FacultyState extends State<Faculty> {
//   List<QueryDocumentSnapshot> facdata = [];
//   bool isLoading = true;
//   bool hasError = false;
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   Future<void> getData() async {
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
//           "university").colletion('colleges')
//       facdata = querySnapshot.docs;
//       setState(() => isLoading = false);
//     } catch (e) {
//       setState(() => hasError = true);
//     }
//   }
//
//   // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//
//   @override
//   Widget build(BuildContext context) {
//     final String universityId = ModalRoute.of(context)!.settings.arguments as String;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     "assets/images/university.png",
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   const Positioned(
//                     bottom: 150,
//                     right: 20,
//                     child: Text(
//                       "قائمة الكليات",
//                       style: TextStyle(fontSize: 28, color: Colors.white),
//                     ),
//                   ),
//                   Positioned(
//                     left: 10,
//                     top: 30,
//                     child: InkWell(
//                       onTap: () => Navigator.pop(context),
//                       child: const Icon(
//                         Icons.arrow_back,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   // Icon(Icons.arrow_back)
//                 ],
//               ),
//             ],
//           ),
//           Positioned.fill(
//             child: Container(
//                 height: 650,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.white,
//                 ),
//                 child: isLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : hasError
//                     ? const Center(child: Text("Something went wrong"))
//                     : facdata.isEmpty
//                     ? const Text("List is empty")
//                     : Text('الأس ${args['name']}')
//             ),
//           )
//         ],
//       ),
//     );}

// Widget getList() {
// ListView myList = ListView.builder(
// itemCount: facdata.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.all(20.0),
// child: InkWell(
// onTap: () {
// Navigator.pushNamed(
// context,
// department.routeName,
// arguments: {
// 'name': facdata[index]['name'],
// 'grade': facdata[index]['grade'],
// 'description': facdata[index]['description'],
// },
// );
// // Navigator.pushNamed(context, department.routeName);
// },
// child: Container(
// width: 265,
// height: 95,
// decoration: BoxDecoration(
// color: const Color(0xff36265D),
// borderRadius: BorderRadius.circular(23),
// ),
// child: Center(
// child: Text('${facdata[index]['name']}',
// // "${facdata[index]['name']}",
// style: const TextStyle(
// color: Colors.white,
// fontSize: 20,
// fontWeight: FontWeight.w700,
// ),
// ),
// ),
// ),
// ),
// );
// },
// );
// return myList;
// }
//   }

//
// class Faculty extends StatelessWidget {
//   static const String routeName = "Faculty";
//
//   @override
//   Widget build(BuildContext context) {
//     final String universityId = ModalRoute.of(context)!.settings.arguments as String;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Colleges'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('universities')
//             .doc(universityId)
//             .collection('colleges')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           var colleges = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: colleges.length,
//             itemBuilder: (context, index) {
//               var college = colleges[index];
//               return ListTile(
//                 title: Text(college['name']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:gradprojec/departments.dart';
// //
// // class Faculty extends StatefulWidget {
// //   static const String routeName = "faculty";
// //
// //   const Faculty({super.key});
// //
// //   @override
// //   State<Faculty> createState() => _FacultyState();
// // }
// //
// // class _FacultyState extends State<Faculty> {
// //   List<QueryDocumentSnapshot> facdata = [];
// //   bool isLoading = true;
// //   bool hasError = false;
// //
// //   @override
// //   void initState() {
// //     getData();
// //     super.initState();
// //   }
// //
// //   Future<void> getData() async {
// //     try {
// //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
// //           "university").colletion('')
// //       facdata = querySnapshot.docs;
// //       setState(() => isLoading = false);
// //     } catch (e) {
// //       setState(() => hasError = true);
// //     }
// //   }
// //
// //   // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final String universityId = ModalRoute.of(context)!.settings.arguments as String;
// //
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Column(
// //             children: [
// //               Stack(
// //                 children: [
// //                   Image.asset(
// //                     "assets/images/university.png",
// //                     width: double.infinity,
// //                     fit: BoxFit.cover,
// //                   ),
// //                   const Positioned(
// //                     bottom: 150,
// //                     right: 20,
// //                     child: Text(
// //                       "قائمة الكليات",
// //                       style: TextStyle(fontSize: 28, color: Colors.white),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     left: 10,
// //                     top: 30,
// //                     child: InkWell(
// //                       onTap: () => Navigator.pop(context),
// //                       child: const Icon(
// //                         Icons.arrow_back,
// //                         size: 30,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                   // Icon(Icons.arrow_back)
// //                 ],
// //               ),
// //             ],
// //           ),
// //           Positioned.fill(
// //             child: Container(
// //                 height: 650,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(50),
// //                   color: Colors.white,
// //                 ),
// //                 child: isLoading
// //                     ? const Center(child: CircularProgressIndicator())
// //                     : hasError
// //                     ? const Center(child: Text("Something went wrong"))
// //                     : facdata.isEmpty
// //                     ? const Text("List is empty")
// //                     : Text('الأس ${args['name']}')
// //             ),
// //           )
// //         ],
// //       ),
// //     );}
// //
// //     // Widget getList() {
// //     // ListView myList = ListView.builder(
// //     // itemCount: facdata.length,
// //     // itemBuilder: (context, index) {
// //     // return Padding(
// //     // padding: const EdgeInsets.all(20.0),
// //     // child: InkWell(
// //     // onTap: () {
// //     // Navigator.pushNamed(
// //     // context,
// //     // department.routeName,
// //     // arguments: {
// //     // 'name': facdata[index]['name'],
// //     // 'grade': facdata[index]['grade'],
// //     // 'description': facdata[index]['description'],
// //     // },
// //     // );
// //     // // Navigator.pushNamed(context, department.routeName);
// //     // },
// //     // child: Container(
// //     // width: 265,
// //     // height: 95,
// //     // decoration: BoxDecoration(
// //     // color: const Color(0xff36265D),
// //     // borderRadius: BorderRadius.circular(23),
// //     // ),
// //     // child: Center(
// //     // child: Text('${facdata[index]['name']}',
// //     // // "${facdata[index]['name']}",
// //     // style: const TextStyle(
// //     // color: Colors.white,
// //     // fontSize: 20,
// //     // fontWeight: FontWeight.w700,
// //     // ),
// //     // ),
// //     // ),
// //     // ),
// //     // ),
// //     // );
// //     // },
// //     // );
// //     // return myList;
// //     // }
// //   }
