class UserModel {
  String? name, email, uId,phone , lastName;
  String? userType ;
  UserModel({this.name, this.email, this.uId, this.userType,this.phone , this.lastName});

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'] ??"";
    email = json['email'];
    uId = json["uId"];
    userType = json["userType"];
    lastName = json['lastName'];
  }

  Map <String, dynamic > toMap (){
    return {
      "name": name,
      "email": email,
      "uId": uId,
      "phone": phone ??"",
      "userType" :userType,
      "lastName" : lastName
    };
  }

}