class CollaboratorModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  CollaboratorModel({this.firstName, this.lastName, this.email ,this.id});

  factory CollaboratorModel.fromJson(Map<String, dynamic> json) {
    return CollaboratorModel(
      firstName: json['firstName'],
      id: json['id'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
