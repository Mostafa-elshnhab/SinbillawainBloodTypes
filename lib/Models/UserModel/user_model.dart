class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phone;
  String? fasela;
  String? gender;
  String? dataOfBirth;
//  String? dataOfTparo3;
  String? man3;
  String? address;
  bool? isVerified;

  UserModel(
      {this.uId,
      this.name,
      this.email,
      this.phone,
      this.fasela,
      this.gender,
      this.dataOfBirth,
//      this.dataOfTparo3,
      this.man3,
      this.address,

      this.isVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    fasela = json['fasela'];
    gender = json['gender'];
    dataOfBirth = json['dataOfBirth'];
//    dataOfTparo3 = json['dataOfTparo3'];
    man3 = json['man3'];
    address = json['address'];
    isVerified = json['isVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'fasela': fasela,
      'gender': gender,
      'dataOfBirth': dataOfBirth,
//      'dataOfTparo3': dataOfTparo3,
      'man3': man3,
      'address': address,
      'isVerified': isVerified,
    };
  }
}
