class ContactModel{
  String studID;
  String name;
  String email;
  int phonenumber;

  ContactModel({
    this.studID="",
    this.name="",
    this.email="",
    required this.phonenumber,

  });


  ContactModel.fromJson(Map<String,dynamic> json):this(
    studID: json['studID'],
    phonenumber: json['phonenumber'],
    name: json['name'],
    email:json['email'],

  );

  Map<String,dynamic> toJson(){
    return {
      "studID":studID,
      "name":name,
      "email":email,
      "phonenumber":phonenumber,

    };


  }}