import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Result extends StatefulWidget {
  static const String routeName = "result";

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  void initState() {
    super.initState();
  }

  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  bool hasError = false;
  var totalController = TextEditingController();
  double total = 0.0;

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("facultiesBasedOnTotal").get();
      data = querySnapshot.docs;
      setState(() => isLoading = false);
    } catch (e) {
      setState(() => hasError = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff36265D),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Color(0xff36265D),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                          "ادخل مجموعك",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        color: Color(0xff42305A),
                        margin: EdgeInsets.only(left: 60, right: 60),
                        child: TextField(
                          controller: totalController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF6CD2E)),
                        onPressed: () {
                          setState(() {
                            if(totalController.text.isNotEmpty)
                            total = double.parse(totalController.text);
                          });
                          if(total == 0.0){
                            Fluttertoast.showToast(
                              msg: "أدخل مجموعك",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 18.0,
                            );
                          }else{
                            getData();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: Text(
                          "اضغط هنا",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: getList(),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget getList() {

    List filteredList = data.where((element)=>element['total']<=total ).toList();

    ListView myList = ListView.separated(

      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: filteredList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var university = filteredList[index];

        return Container(
            decoration: BoxDecoration(
              color: const Color(0xff36265D),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              textColor: Colors.white,
              leading: Text(  "${index+1}"),
              title: Text(  "${university['faculty_name']}"),
              trailing: Text(  "${university['university_name']}"),
            )
        );
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
       if(total != 0.0)
       Row(
         children: [
           Text("الكليات المتاحة لمجموعك : "),
           Text("${total}",style: TextStyle(fontSize: 20),),
         ],
       ),
        SizedBox(
          height: 10,
        ),
       if(filteredList.isNotEmpty) myList,
       if(total != 0.0 && filteredList.isEmpty)  Column(
         children: [
           SizedBox(
             height: 40,
           ),
           Center(child: Text("لا يوجد كليات متاحة لمجموعك"),)
         ],
       )
      ],
    );
  }
}
