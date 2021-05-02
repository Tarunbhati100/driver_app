class User {
  String name;
  String email;
  String phoneNumber;
  String password;
  String userId;
  String city;
  User({this.name, this.password, this.email, this.phoneNumber, this.city});
  User.fromMap(Map<String, dynamic> map) {
    this.name = map["name"] ?? "";
    this.email = map["email"];
    this.phoneNumber = map["phoneNumber"];
    this.password = map["password"];
    this.userId = map["userId"] ?? "";
    this.city = map["city"];
  }
  toJson(String userId) {
    return {
      "name": this.name,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "password": this.password,
      "city": this.city,
    };
  }
}
